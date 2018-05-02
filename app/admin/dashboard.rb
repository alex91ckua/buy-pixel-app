ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc{ I18n.t('active_admin.dashboard') }

  content title: proc{ I18n.t('active_admin.dashboard') } do

    columns do
      column do
        panel 'Recent Orders' do

          table_for Order.order('id DESC').first(10) do
            column('ID') { |order| link_to '#{order.id}', admin_order_path(order.id) }
            column('State') { |order| status_tag(order.order_status.name) }
            column('Sponsor Name') { |order| order.sponsor_name }
            column('Total') { |order| number_to_currency order.total }
          end

        end
      end

    end

  end # content
end
