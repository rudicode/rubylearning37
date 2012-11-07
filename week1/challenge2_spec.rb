# require 'rubygems'
require File.expand_path('../convert', __FILE__)

describe "Conversion" do
  describe "to Kelvin" do

    it "should convert Fahrenheit to Kelvin" do
      f_to_k(98.6).should eq(310.15)
      f_to_k(212.0).should eq(373.15)
    end
    
    it "should convert Celsius to Kelvin" do
      c_to_k(37.0).should eq(310.15)
      c_to_k(100.0).should eq(373.15)
    end
  
  end
  
  describe "Kelvin to" do

    it "should convert Kelvin to Fahrenheit" do
      k_to_f(310.15).should eq(98.6)
      k_to_f(373.15).should eq(212.0)
    end
    
    it "should convert Kelvin to Celsius" do
      k_to_c(310.15).should eq(37.0)
      k_to_c(373.15).should eq(100.0)
    end
    
    it "should convert Kelvin to Kelvin" do
      temp = 1.1
      k_to_k(temp).should eq(temp)
    end

  end
  
  describe "Celsius" do
    
    it "should convert Celsius to Fahrenheit" do
      c_to_f(0.0).should == 32.0
      c_to_f(37.0).should == 98.6
      c_to_f(100.0).should == 212.0
    end
    
    it "should convert Fahrenheit to Celsius" do
      f_to_c(32.0).should == 0.0
      f_to_c(98.6).should == 37.0
      f_to_c(212.0).should == 100.0  
    end
  end
end
