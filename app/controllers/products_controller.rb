class ProductsController < Wallaby::ResourcesController
  def new
    flash.now[:warning] = "Do not change the sales price if CEO asked but CFO hasn't approved!"
    super
  end
end
