require 'net/https'
require 'net/http'
require 'cgi'
require 'json'

class YMClient
  def self.encode_params prms
    prms.inject ('') { |acc, (k, v)|
      acc + CGI::escape(k) + "=" + CGI::escape(v.to_s) + '&'
    }
  end

  def self.default_args
    {:port => 443,
     :ssl => true,
     :timeout => 50}
  end

  def self.client args = {}
    args = default_args.merge args 
    cli = Net::HTTP.new args[:host], args[:port]
    cli.use_ssl = args[:ssl]
    #Not enough percise timeout but will not block execution
    cli.read_timeout = cli.open_timeout = cli.ssl_timeout = args[:timeout]
    cli
  end

  def self.result res
    raise res.value if ! res.instance_of?(Net::HTTPOK)
    res.body
  end

  def self.get args = {}
    qpath = args[:path] + '?' + encode_params(args[:params])
    result(client(args).get2 qpath, args[:headers])
  end

  def self.post args = {}
    result(client(args).post2 args[:path], encode_params(args[:params]))
  end

  def self.put args = {}
    '{"error" : "not implemented yet"}'
  end

  def self.delete args = {}
    '{"error" : "not implemented yet"}'
  end
end

class YandexMetric
  OAUTH_HOST = 'oauth.yandex.ru'
  OAUTH_PORT = 443
  OAUTH_PATH = '/token'
  API_HOST = 'api-metrika.yandex.ru'
  API_PORT = 443
  SSL = true

  def default_options
    {:timeout => 50}
  end

  def default_headers
    {'Accept' => 'application/x-yametrika+json'}
  end

  attr_reader :options
  def initialize options = {}
    @options = default_options.merge options
  end

  def init_token
    params = {'grant_type' => 'password'}
    [:username, :password, :client_id, :client_secret].each do |key|
      options.has_key? key or raise "#{key} is not defined"
      params[key.to_s] = options[key]
    end
    args = {
      :host => OAUTH_HOST,
      :port => OAUTH_PORT,
      :ssl => SSL,
      :path => OAUTH_PATH,
      :params => params,
      :headers => {},
      :timeout => options[:timeout]
    }
    JSON.parse(YMClient.post args)['access_token']
  end

  def get_token
    @token ||= init_token
  end

  def generic_method method, path, params
    headers = default_headers.merge({'Authorization' => ("OAuth " + get_token)})
    args = {
      :host => API_HOST,
      :port => API_PORT,
      :ssl => SSL,
      :path => path,
      :params => params,
      :headers => headers,
      :timeout => options[:timeout]
    }
    JSON.parse(YMClient.send method, args)
  end

  def self.method_name method, path
      #/path/{id}/param => path_param
      method_tail = path[1..-1].gsub(/\/{[a-zA-Z0-9_]+}/, '').gsub(/\//, '_')
      #'GET /path/{id}/param' => 'get_path_param'
      method.downcase + '_' + method_tail
  end

  def self.ya_method data
    (description, path, methods, param_desc) = data
    #path sometimes starts with '/' but not always
    path[0] != '/' and path = '/' + path
    methods.split(' ').each do |m|
      define_method method_name(m, path) do |args = {}|
        #/path/{id}/param => /path/id_value/param
        real_path = path.gsub(/\{[a-zA-Z0-9_]+\}/) {|id| args[id[1..-2]]} 
        generic_method m.downcase.to_sym, real_path, args
      end
    end
  end

end

load 'yandex_metric_methods.rb'
