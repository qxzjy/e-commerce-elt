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
Customer subscription_plan (basic, standard or premium)
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
Payment method (bank_transfer, credit_card or paypal)
{% enddocs %}

{% docs payments__payment_method_type %}
Payment method type (delayed or instant)
{% enddocs %}

{% docs payments__payment_date %}
Payment date
{% enddocs %}