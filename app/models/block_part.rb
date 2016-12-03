class BlockPart < ApplicationRecord
  belongs_to :text_style
  belongs_to :block
end
