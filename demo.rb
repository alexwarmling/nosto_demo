require "watir-webdriver"
require "test-unit"

class Demo < Test::Unit::TestCase
	class << self
		def startup
			begin
				$browser = Watir::Browser.start 'http://pablo-cabrera.eti.br/sample?nostodebug=true'
			rescue Timeout::Error
				$browser.close
			end
		end

		def shutdown
			$browser.close
		end
	end

	def navigate_product
		high = $browser.div(:class => 'productListing highlights').lis
		prod = rand(0..19)
		high[prod].link.click
	end

	def add_to_cart
		$browser.link(:class => 'buy').click
	end
	
	def buy
		$browser.image(:id => 'confirm-buy').click
	end

	def login
		$browser.text_field(:name => 'businessId').set 'teste@chaordicsystems.com'
		$browser.button(:class => 'login').click
	end

	def test_01_buy
		navigate_product
		add_to_cart
		buy
		login
	end

end