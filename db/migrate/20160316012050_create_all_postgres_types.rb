class CreateAllPostgresTypes < ActiveRecord::Migration
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    enable_extension 'ltree' unless extension_enabled?('ltree')
    enable_extension 'citext' unless extension_enabled?('citext')
    create_table :all_postgres_types do |t|
      t.column :string, :string
      t.column :text, :text
      t.column :integer, :integer
      t.column :float, :float
      t.column :decimal, :decimal
      t.column :datetime, :datetime
      t.column :time, :time
      t.column :date, :date
      t.column :daterange, :daterange
      t.column :numrange, :numrange
      t.column :tsrange, :tsrange
      t.column :tstzrange, :tstzrange
      t.column :int4range, :int4range
      t.column :int8range, :int8range
      t.column :binary, :binary
      t.column :boolean, :boolean
      t.column :bigint, :bigint
      t.column :xml, :xml
      t.column :tsvector, :tsvector
      t.column :hstore, :hstore
      t.column :inet, :inet
      t.column :cidr, :cidr
      t.column :macaddr, :macaddr
      t.column :uuid, :uuid
      t.column :json, :json
      t.column :jsonb, :jsonb
      t.column :ltree, :ltree
      t.column :citext, :citext
      t.column :point, :point
      t.column :bit, :bit
      t.column :bit_varying, :bit_varying
      t.column :money, :money
    end
  end
end
