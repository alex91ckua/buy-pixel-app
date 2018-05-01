ActiveAdmin.register Order do

  actions :all
  remove_filter :order_items, :updated_at
  permit_params :sponsor_name, :order_status

  scope :all, default: true
  scope('Placed') { |scope| scope.where(order_status: Order.order_statuses[:placed]) }
  scope('In progress') { |scope| scope.where(order_status: Order.order_statuses[:in_progress]) }
  scope('Canceled') { |scope| scope.where(order_status: Order.order_statuses[:canceled]) }
end
