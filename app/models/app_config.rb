class Document < ActiveRecord::Base
  WillPaginate.per_page = 1
end