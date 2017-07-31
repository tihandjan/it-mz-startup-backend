class Api::V1::StepSerializer < ActiveModel::Serializer
  attributes :id, :step, :image, :content
end
