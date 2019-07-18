# frozen_string_literal: true

class Station < ApplicationRecord
  has_many :gas_entries
  has_many :user_stations, :dependent => :destroy
  has_many :users, :through => :user_stations

  scope :with_user_visits, ->(user) {
    visits_t = Arel::Table.new(:visits)
    visits_d = GasEntry.for_user(user).select(:station_id).arel
    visits = Arel::Nodes::As.new(visits_t, visits_d)

    stations_d = arel_table.
      project(arel_table[Arel.star], visits_t[:station_id].count.as("visits")).
      join(visits_t, Arel::Nodes::OuterJoin).on(visits_t[:station_id].eq(arel_table[:id])).
      group(arel_table[:id], visits_t[:station_id]).
      with(visits)

    from(stations_d.as("stations"))
  }
end
