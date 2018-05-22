# Buy pixel application

Simple rails ecommerce app which allows you to buy a product using Stripe payment gateway. 

### Gems used

- ActiveAdmin for admin panel
- Stripe as payment gateway
- Carrierwave as file uploader
- friendly_id to make pretty product page url
- activeadmin_froala_editor as WYSIWYG editor for ActiveAdmin

### Installation

```sh
$ rails db:create db:migrate
$ rails db:seed
$ rails s
```