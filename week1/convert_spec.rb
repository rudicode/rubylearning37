# require 'rubygems'
require File.expand_path('../convert', __FILE__)

describe "should Convert" do
  
  describe "Kelvin to" do

    it "Fahrenheit" do
      convert(310.15,'k','f').should eq(98.6)
      convert(373.15,'k','f').should eq(212.0)
    end
    
    it "Celsius" do
      convert(310.15,'k','c').should eq(37.0)
      convert(373.15,'k','c').should eq(100.0)
    end
    
    it "Rankine" do
      convert(0.0,'k','r').should eq(0.0)
      convert(273.15,'k','r').should be_within(0.00000001).of(491.67)
        # what is the tolerance here?
    end
    
    it "Kelvin" do
      temp = 1.1
      convert(temp,'k','k').should eq(temp)
    end

  end
  
  describe "Celsius to" do
    
    it "Fahrenheit" do
      convert(0.0,'c','f').should == 32.0
      convert(37.0,'c','f').should == 98.6
      convert(100.0,'c','f').should == 212.0
    end
    
    it "Kelvin" do
      convert(37.0,'c','k').should eq(310.15)
      convert(100.0,'c','k').should eq(373.15)
    end
    
    it "Rankine" do
      convert(37.0,'c','r').should eq(558.27)
      convert(100.0,'c','r').should eq(671.67)
    end
    
  end
  
  describe "Fahrenheit to" do
    it "Kelvin" do
      convert(98.6,'f','k').should eq(310.15)
      convert(212.0,'f','k').should eq(373.15)
    end
    
    it "Celsius" do
      convert(32.0,'f','c').should == 0.0
      convert(98.6,'f','c').should == 37.0
      convert(212.0,'f','c').should == 100.0
    end
    
    it "Rankine" do
      convert(98.6,'f','r').should eq(558.27)
      convert(212.0,'f','r').should eq(671.67)
    end
    
  end

  describe "Rankine to" do

    it "Kelvin" do
      convert(0.0,'r','k').should eq(0.0)
      convert(491.67,'r','k').should eq(273.15)
    end
    
    it "Fahrenheit" do
      convert(0.0,'r','f').should be_within(0.00000001).of(-459.67)
      convert(671.67,'r','f').should eq(212.0)
    end
    
    it "Celsius" do
      convert(0.0,'r','f').should be_within(0.00000001).of(-459.67)
      convert(671.67,'r','f').should eq(212.0)
    end
    
  end
  
  describe "back and forth" do
    it "for Celsius" do
      convert(  convert(10.0,'c','k') ,'k','c').should be_within(0.00000001).of(10.0)
    end
    
    it "for Fahrenheit" do
      convert(  convert(10.0,'f','k') ,'k','f').should be_within(0.00000001).of(10.0)
    end
    
    it "for Rankine" do
      convert(  convert(10.0,'r','k') ,'k','r').should be_within(0.00000001).of(10.0)
    end
    
    it "for Kelvin" do
      convert(  convert(10.0,'k','k') ,'k','k').should be_within(0.00000001).of(10.0)
    end
  end
    
end
