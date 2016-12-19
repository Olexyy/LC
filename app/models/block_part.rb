class BlockPart < ApplicationRecord
  belongs_to :block
  has_many :block_field_block_parts
  has_many :block_fields, through: :block_field_block_parts
end