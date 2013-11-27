ActiveRecord::Schema.define(:version => 0) do

  create_table :projects, :force => true do |t|
    t.string :title
    t.text :summary
    t.text :body
    t.integer :views
  end

end

