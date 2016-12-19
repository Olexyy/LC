class BlockFieldBlockPart < ApplicationRecord
  belongs_to :block_field
  belongs_to :block_part
end
