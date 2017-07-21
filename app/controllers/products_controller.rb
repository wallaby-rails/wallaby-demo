class ProductsController < Wallaby::ResourcesController
  def new
    flash.now[:warning] = "<strong>Do not change the sales price if CEO asked but CFO hasn't approved!</strong>".html_safe
    super
  end
end
