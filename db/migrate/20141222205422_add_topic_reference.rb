class AddTopicReference < ActiveRecord::Migration
  def change
    add_reference :lessons, :topic, index: true
  end
end
