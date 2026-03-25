{% docs customers__customer_id %}
Customer unique ID
{% enddocs %}

{% docs customers__first_name %}
Customer first name
{% enddocs %}

{% docs customers__last_name %}
Customer last name
{% enddocs %}

{% docs customers__email %}
Customer email
{% enddocs %}

{% docs customers__subscription_plan %}
Customer subscription_plan (free, plus or pro)
{% enddocs %}

{% docs customers__created_at %}
Customer creation date
{% enddocs %}

{% docs customers__is_old_client %}
Is the consumer an old one ?
{% enddocs %}



{% docs orders__order_id %}
Order unique ID
{% enddocs %}

{% docs orders__customer_id %}
Customer ID associated with the order
{% enddocs %}

{% docs orders__order_date %}
Order date
{% enddocs %}

{% docs orders__status %}
Order status (canceled or completed)
{% enddocs %}

{% docs orders__is_completed_order %}
Is the order complete ?
{% enddocs %}



{% docs order_items__item_id %}
Item unique ID
{% enddocs %}

{% docs order_items__order_id %}
Order ID associated with the item
{% enddocs %}

{% docs order_items__product_id %}
Product ID associated with the item
{% enddocs %}

{% docs order_items__quantity %}
Item quantity
{% enddocs %}



{% docs payments__payment_id %}
Payment unique ID
{% enddocs %}

{% docs payments__order_id %}
Order ID associated with the payment
{% enddocs %}

{% docs payments__amount %}
Payment amount
{% enddocs %}

{% docs payments__payment_method %}
Payment method (bank_transfer, credit_card, paypal or refund)
{% enddocs %}

{% docs payments__payment_method_type %}
Payment method type (delayed or instant)
{% enddocs %}

{% docs payments__payment_date %}
Payment date
{% enddocs %}



{% docs products__product_id %}
Product unique ID
{% enddocs %}

{% docs products__name %}
Product name
{% enddocs %}

{% docs products__price %}
Product price
{% enddocs %}

{% docs products__price_range %}
Price range (0 - 75, 75 - 150 or +150)
{% enddocs %}

{% docs products__category %}
Product category (accessories, electronics, furniture, home office or lifestyle)
{% enddocs %}



{% docs shipments__shipment_id %}
Shipment unique ID
{% enddocs %}

{% docs shipments__order_id %}
Order ID associated with the shipment
{% enddocs %}

{% docs shipments__shipped_date %}
Shipment date
{% enddocs %}

{% docs shipments__delivery_date %}
Delivery date
{% enddocs %}

{% docs shipments__carrier %}
Carrier name (dhl, fedex or ups)
{% enddocs %}



{% docs order_items_enriched__gross_amount %}
Gross amount for the item
{% enddocs %}



{% docs orders_aggregated__total_line_items %}
Total number of item lines in the order
{% enddocs %}

{% docs orders_aggregated__total_quantity %}
Total quantity of items in the order
{% enddocs %}

{% docs orders_aggregated__order_total_amount %}
Total amount of the order
{% enddocs %}



{% docs carrier__carrier_sk %}
Carrier surrogate key (carrier)
{% enddocs %}



{% docs customers__customer_sk %}
Customer surrogate key (customer_id, dbt_valid_from)
{% enddocs %}



{% docs date__date_sk %}
Date surrogate key (date_day)
{% enddocs %}



{% docs payment_method__payment_method_sk %}
Payment method surrogate key (payment_method)
{% enddocs %}



{% docs products__product_sk %}
Product surrogate key (product_id)
{% enddocs %}



{% docs order_items__order_items_sk %}
Order items surrogate key (order_id, product_id)
{% enddocs %}




{% docs order__order_date_sk %}
Order date surrogate key (date_day)
{% enddocs %}




{% docs payments__payment_date_sk %}
Payment date surrogate key (date_day)
{% enddocs %}




{% docs shipments__shipped_date_sk %}
Shipped date surrogate key (date_day)
{% enddocs %}

{% docs shipments__delivery_date_sk %}
Delivery date surrogate key (date_day)
{% enddocs %}

{% docs shipments__shipping_duration_days %}
Shipping duration (days)
{% enddocs %}