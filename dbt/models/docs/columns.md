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