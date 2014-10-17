<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<!-- Header -->
<div class="row">
	<div class="col-md-10 col-md-offset-1">
		<h1 style="text-align:center;">{$title}</h1>
		<p style="text-align:center; font-size:20px;">{$pageinfo}</p>
		<hr>
	</div>
</div>

<!-- Horizontal Steps -->
<div class="row">
    <div class="col-xs-12">
        {include file="orderforms/$carttpl/_includes/verticalsteps.tpl" step=$step}
    </div>
</div>


<!-- Main Content -->
<div class="row">

	<div class="col-md-8">