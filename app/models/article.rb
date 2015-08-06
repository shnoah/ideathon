class Article < ActiveRecord::Base
    has_and_belongs_to_many :tags
    has_many :replies
    has_many :statuses
    has_many :members
    has_many :users, through: :statuses
    
    mount_uploader :my_image, S3uploaderUploader #AWS Image uplo
 
end
