ActiveAdmin.register Product do
  # actions :all, except: [:destroy, :new, :create]
  remove_filter :order_items, :updated_at
  permit_params :name,
                :active,
                :price,
                :money_goal,
                :in_stock,
                :from_date,
                :to_date,
                :product_image,
                :description_1,
                :description_2,
                :description_1_ar,
                :description_2_ar,
                :slider_1_image_1,
                :slider_1_image_2,
                :slider_1_image_3,
                :slider_2_image_1,
                :slider_2_image_2,
                :slider_2_image_3,
                :headline_1,
                :headline_2,
                :head_description,
                :video_id,
                :custom_pixel_percentage,
                faqs_attributes: [:id, :question, :answer, :_destroy]
  form do |f|
    panel 'Basic Info' do
      f.inputs do
        f.input :name
        f.input :active
        f.input :price
        f.input :custom_pixel_percentage
        f.input :money_goal
        f.input :in_stock
        f.input :from_date
        f.input :to_date
        f.input :product_image
        f.input :video_id
        end
    end
    panel 'Header' do
      f.inputs do
        f.input :headline_1
        f.input :headline_2
        f.input :head_description, as: :text
      end
    end
    panel 'Description' do
      f.inputs do
        f.input :description_1, as: :froala_editor
        f.input :description_2, as: :froala_editor
        f.input :description_1_ar, as: :froala_editor, input_html:
            {
              data: {
                options: {
                  direction: 'rtl'
                }
              }
            }
        f.input :description_2_ar, as: :froala_editor, input_html:
            {
                data: {
                    options: {
                        direction: 'rtl'
                    }
                }
            }
      end
    end
    panel 'FAQ' do
      f.inputs do
        f.has_many :faqs, heading: false,
                   allow_destroy: true,
                   new_record: true do |faq|
          faq.input :question
          faq.input :answer
        end
      end
    end
    panel 'Slider 1' do
      f.inputs do
        f.input :slider_1_image_1, :as => :file, :hint => f.object.slider_1_image_1.present? ? \
                                              image_tag(f.object.slider_1_image_1.url, width: 100) : \
                                              content_tag(:span, 'no image selected')
        f.input :slider_1_image_2, :as => :file, :hint => f.object.slider_1_image_2.present? ? \
                                              image_tag(f.object.slider_1_image_2.url, width: 100) : \
                                              content_tag(:span, 'no image selected')
        f.input :slider_1_image_3, :as => :file, :hint => f.object.slider_1_image_3.present? ? \
                                              image_tag(f.object.slider_1_image_3.url, width: 100) : \
                                              content_tag(:span, 'no image selected')
      end
    end
    panel 'Slider 2' do
      f.inputs do
        f.input :slider_2_image_1, :as => :file, :hint => f.object.slider_2_image_1.present? ? \
                                              image_tag(f.object.slider_2_image_1.url, width: 100) : \
                                              content_tag(:span, 'no image selected')
        f.input :slider_2_image_2, :as => :file, :hint => f.object.slider_2_image_2.present? ? \
                                              image_tag(f.object.slider_2_image_2.url, width: 100) : \
                                              content_tag(:span, 'no image selected')
        f.input :slider_2_image_3, :as => :file, :hint => f.object.slider_2_image_3.present? ? \
                                              image_tag(f.object.slider_2_image_3.url, width: 100) : \
                                              content_tag(:span, 'no image selected')
      end
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :name
    column :price
    column :product_image do |p|
      if p.product_image.url
        image_tag p.product_image.url, width: 100
      end
    end
    column :created_at
    actions
  end


  # show do
  #   attributes_table do
  #     row :name
  #     row :total
  #     row :product_image do
  #       image_tag(object.url)
  #     end
  #   end
  # end

end
