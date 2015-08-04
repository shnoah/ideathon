class Article < ActiveRecord::Base
    has_and_belongs_to_many :tags
    has_many :replies
    has_and_belongs_to_many :user
    has_many :members
    
    mount_uploader :my_image, S3uploaderUploader #AWS Image uplo
 
end
