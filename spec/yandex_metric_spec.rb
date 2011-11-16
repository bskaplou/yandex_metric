require 'yandex_metric'

describe Yandex::Metric do
  before(:each) do
    @it = Yandex::Metric.new({})
  end

  describe '#method_name' do
    it 'should downcase http method name' do
      Yandex::Metric.method_name('GET', '/t').should eql('get_t')
    end

    it 'should replace {name} from path' do
      Yandex::Metric.method_name('GET', '/t/{asdas}/f').should eql('get_t_f')
    end
  end

  describe '#api_method' do
    it 'should create multiple methods for different http method' do
      Yandex::Metric.api_method 'description', '/test', 'GET POST', 'param desc'
      @it.should respond_to(:get_test) 
      @it.should respond_to(:post_test) 
    end

    it 'should replace {id} from method path' do
      Yandex::Metric.api_method 'description', '/f/{id}/s', 'POST', 'param desc'
      @it.should respond_to(:post_f_s) 
    end

    it 'should ignore first slash in path' do
      Yandex::Metric.api_method 'description', 'f', 'POST', 'param desc'
      @it.should respond_to(:post_f) 
      Yandex::Metric.api_method 'description', '/s', 'POST', 'param desc'
      @it.should respond_to(:post_s) 
    end
  end
end
