require 'rubygems'
require 'watir-webdriver'

class Rpdpage

def initialize(url)
   Selenium::WebDriver::Chrome.driver_path="C:/Users/mchinnala/chromedriver.exe"
   #driver=Selenium::WebDriver.for :chrome
   @browser=Watir::Browser.new:chrome
   @browser.goto(url)
   @browser.window.maximize
 end
 
  def create_rpd_tab()
    @browser.element(:xpath=>"//*[text()='Create New RPD']")
  
  end
  
  def tab()
    sleep 5
        @browser.driver.switch_to.window(@browser.driver.window_handles[1])
  end
  
  def request_type()
    
     if  @browser.element(:xpath=>"//*[@data-qa-id='rpd-create-type-bug']").exists?
       
       @browser.element(:xpath=>"//*[@data-qa-id='rpd-create-type-bug']").click
       @browser.element(:xpath=>"//*[text()='Severity']").click
     
     
   else 
     
     puts "request type not found"

     end
    
   end
  def severity_type()
      
     if @browser.element(:xpath=>"(//button[@class='btn btn-default ng-binding ng-scope'])[4]").exists?
       @browser.element(:xpath=>"(//button[@class='btn btn-default ng-binding ng-scope'])[4]").click
     else
       
       puts "severity type not found"
     end
     end
     def select_product()
       @browser.element(:xpath=>"//*[text()='Product']").click
       @browser.element(:xpath=>"//*[@data-qa-id='rpd-create-chooseproduct-textbox']").click
       @browser.element(:xpath=>"//*[@data-qa-id='rpd-create-chooseproduct-textbox']").send_keys(34566)
       sleep 15
       if  @browser.element(:xpath=>"//*[text()='Test product for automation']").present?
       @browser.element(:xpath=>"//*[text()='Test product for automation']").click
       else
         puts("Product not found")
       end
       end
       
     #  def scroll_by()
        # sleep 10
       # button1 = @browser.input(:xpath => "//span[@class='control-label']")
        # @browser.scroll.to button1
        # button1.scroll.to :bottom

     #  end
              
     def enter_title()
       @browser.element(:xpath=>"//*[contains(@data-qa-id,'rpd-create-title')]").click
       @browser.element(:xpath=>"//*[contains(@data-qa-id,'rpd-create-title')]").send_keys("Test RPD")
       @browser.element(:xpath=>"//*[contains(text(),'Detailed Description')]").click
     end
     def enter_description()
       frame=@browser.iframe(:xpath=>"(//iframe[@id='newrpd_editor_ifr'])")
       frame.element(:xpath=>"(//body[@id='tinymce'])").click
       frame.element(:xpath=>"(//body[@id='tinymce'])").send_keys("This is Test RPD. Please Ignore")
     end  
     def entity_type()
       @browser.element(:xpath=>"//*[contains(@data-qa-id,'rpd-create-entitytype-dropdown')]").click
       @browser.element(:xpath=>"//*[@value='Employee']").click
       #if @browser.element(:xpath=>"//*[contains(@class,'ng-binding ng-scope HoverInvokeElement' and text(),'Madhavi Chinnala')]").exists?
        # return true
       #else false
        #end
        end
        
    def advanced_button()
           
       @browser.element(:xpath=>"//span[@class='control-label']").click
     end
     
     #def scroll_bytosubmit()
       
      # button2 = @browser.input(:xpath => "//button[@name='btnSubmit']")
         #@browser.scroll.to button2
       # button2.scroll.to :bottom

       
     #end
       
       
     
     def submit_button()
        tab()
       request_type()
       severity_type()
       select_product()
       enter_title()
       enter_description()
       entity_type()
       advanced_button()
              
         @browser.element(:xpath=>"//button[@name='btnSubmit']")

     end
       
    
end

   driver=Rpdpage.new("http://iswebqa.pc.factset.com/rpd/Default.aspx?tab=0")
   driver.create_rpd_tab.click()
   sleep 10
   driver.submit_button.click()
   
       # title - "//*[contains(@data-qa-id,'rpd-create-title')]"
   #advance button $x("//span[@class='control-label']")
#entity - $x("//*[contains(@data-qa-id,'rpd-create-entitytype-dropdown')]")
#"//*[contains(@id,'mceu_34')]"



