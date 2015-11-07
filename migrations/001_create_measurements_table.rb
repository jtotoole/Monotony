Sequel.migration do 
  change do
    create_table(:measurements) do
      primary_key :id
      Integer :size, default: 0
      DateTime :created_at
      DateTime :updated_at
    end
  end
end