class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  #一つのコメントは一つのユーザーとトピックに紐づいている。
end
