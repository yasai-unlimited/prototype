module CarrierWave::RMagick
  module ClassMethods
    def crop(rate_w, rate_h, min_w, min_h)
      process :crop => [rate_w, rate_h, min_w, min_h]
    end
  end
  def crop(rate_w, rate_h, min_w, min_h, gravity=Magick::CenterGravity)
    manipulate! do |img|
      _w = img.columns
      _h = img.rows
      width  = [[[_w * rate_w, _w].min, min_w].max, _w].min.to_i
      height = [[[_h * rate_h, _h].min, min_h].max, _h].min.to_i
      img.crop!(gravity, width, height)
      img = yield(img) if block_given?
      img
    end
  end
end