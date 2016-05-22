class WelcomeController < ApplicationController
  #首页
  def index
  end
  #公司简介
  def introduction
  end
  #最新资讯
  def lastest_article
  end
  #产品展示
  def products_show
    @products = Product.all
  end
  #公司资质或者公司荣誉
  def company_honor
  end
  #联系我们
  def contact_us
  end
end
