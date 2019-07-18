# frozen_string_literal: true

module ApplicationHelper
  def base_title
    "Gas Tracker"
  end

  def full_title(page_title)
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end

  def modal(name, id, partial)
    content_tag(:div, :class => ["modal", "fade"], :id => id) do
      content_tag(:div, :class => "modal-dialog") do
        content_tag(:div, :class => "modal-content") do
          content_tag(:div, content_tag(:button, "&times;".html_safe, :class => "close", :data => { :dismiss => "modal" }) + content_tag(:h3, name, :class => "modal-title"), :class => "modal-header") +
            content_tag(:div, render(partial), :class => "modal-body") +
            content_tag(:div, content_tag(:button, "Close", :class => ["btn", "btn-default"], :data => { :dismiss => "modal" }), :class => "modal-footer")
        end
      end
    end
  end

  def active?(page)
    current_page?(page) ? "active" : ""
  end

  def add_station_fields(form)
    new_object = form.object.build_station
    id = new_object.object_id
    fields = begin
      content_tag(:div, :class => "well") do
        content_tag(:h2, "Add New Station") +
          form.fields_for(:station) { |station_form| render "stations/fields", :form => station_form }
      end
    end
    link_to "Add New Station", "#", :id => "add_station", :class => "btn btn-lg btn-block btn-default", :data => { :id => id, :fields => fields.gsub("\n", "") }
  end

  def bootstrap_class_for(flash_type)
    flashes = { :success => "alert-success", :error => "alert-danger", :alert => "alert-block", :notice => "alert-info" }
    flashes.fetch(flash_type.to_sym) { flash_type.to_s }
  end
end
