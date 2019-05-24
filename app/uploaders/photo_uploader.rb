class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # def public_id
  #   return "hipsterblends/cocktail-" + model.short_name
  #  end
end
