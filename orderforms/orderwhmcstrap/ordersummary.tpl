<div class="panel panel-primary">

    <div class="panel-heading">
        <h3 class="panel-title">{$producttotals.productinfo.groupname} - <b>{$producttotals.productinfo.name}</h3>
    </div>

    <table class="table table-striped table-bordered">

        <thead>
            <tr>
                <th width="75%">Description</th>
                <th>Price</th>
            </tr>
        </thead>

        <tbody>

            <tr>
            <td>{$producttotals.productinfo.name}</td>
            <td class="text-right">{$producttotals.pricing.baseprice}</td>
            </tr>
            {foreach from=$producttotals.configoptions item=configoption}{if $configoption}
                <tr>
                <td style="padding-left:10px;">&raquo; {$configoption.name}: {$configoption.optionname}</td>
                <td class="text-right">{$configoption.recurring}{if $configoption.setup} + {$configoption.setup} {$LANG.ordersetupfee}{/if}</td>
                </tr>
            {/if}{/foreach}
            {foreach from=$producttotals.addons item=addon}
                <tr>
                <td>+ {$addon.name}</td>
                <td class="text-right">{$addon.recurring}</td>
                </tr>
            {/foreach}

        </tbody>
    </table>

    {if $producttotals.pricing.setup || $producttotals.pricing.recurring || $producttotals.pricing.addons}

        <div class="summaryproduct"></div>

        <table class="table table-striped table-bordered">
            {if $producttotals.pricing.setup}
                <tr>
                <td width="75%">{$LANG.cartsetupfees}:</td>
                <td class="text-right">{$producttotals.pricing.setup}</td>
                </tr>
            {/if}
            {foreach from=$producttotals.pricing.recurringexcltax key=cycle item=recurring}
                <tr>
                <td>{$cycle}:</td>
                <td class="text-right">{$recurring}</td>
                </tr>
            {/foreach}
            {if $producttotals.pricing.tax1}
                <tr>
                <td>{$carttotals.taxname} @ {$carttotals.taxrate}%:</td>
                <td class="text-right">{$producttotals.pricing.tax1}</td>
                </tr>
            {/if}
            {if $producttotals.pricing.tax2}
                <tr>
                <td>{$carttotals.taxname2} @ {$carttotals.taxrate2}%:</td>
                <td class="text-right">{$producttotals.pricing.tax2}</td>
                </tr>
            {/if}
        </table>
    {/if}

    <div class="summaryproduct"></div>
    <table class="table table-striped table-bordered">
        <tr>
            <td width="75%" class="text-right">{$LANG.ordertotalduetoday}:</td>
            <td class="text-right">{$producttotals.pricing.totaltoday}</td>
        </tr>
    </table>

</div>