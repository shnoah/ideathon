class Reply < ActiveRecord::Base
    belongs_to :article
    has_many :re_replies
end
