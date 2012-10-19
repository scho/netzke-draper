require 'spec_helper'

describe Netzke::Basepack::DataAccessor do
  describe "#decorator_class" do

    before(:each) do
      Netzke::Draper::Configuration.reset_config
    end

    it "by convention" do
      c = DecoratedComponent.new
      c.decorator_class.should == BookDecorator
    end

    it "by string" do
      c = StringDecoratorComponent.new
      c.decorator_class.should == NovelDecorator
    end

    it "by class" do
      c = ClassDecoratorComponent.new
      c.decorator_class.should == NovelDecorator
    end

    it "not set" do
      c = UndecoratedComponent.new
      c.decorator_class.should be_false
    end

    it "not set by config" do
      Netzke::Draper.configure do |config|
        config.decorate_by_default = false
      end

      c = DecoratedComponent.new
      c.decorator_class.should be_false
    end

  end
end
