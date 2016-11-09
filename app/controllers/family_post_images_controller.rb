class FamilyPostImagesController < ApplicationController
  def upload
    @item = Item.find(params[:id])
    item_image = @item.item_images.build(image: params['file'])
    item_image.save
  end
end