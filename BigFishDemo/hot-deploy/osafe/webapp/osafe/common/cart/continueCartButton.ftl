<#assign localNextButtonVisible = nextButtonVisible!"Y">
<#assign localNextButtonUrl = nextButtonUrl!"javascript:submitCheckoutForm(document.${formName!}, 'DN', '');">
<#assign localNextButtonClass = nextButtonClass!"standardBtn positive">
<#assign localNextButtonDescription = nextButtonDescription!uiLabelMap.ContinueBtn>

<#assign localSubmitButtonVisible = submitButtonVisible!"N">
<#if localSubmitButtonVisible == "Y">
 <div class="${request.getAttribute("attributeClass")!}">
  <input type="submit" id="js_submitCartBtn" name="submitCartBtn" value="${localNextButtonDescription}" onmouseover="javascript:setCheckoutFormAction(document.${formName!}, 'DN', '');" class="${localNextButtonClass}" />
 </div>
<#elseif localNextButtonVisible == "Y">
  <div class="${request.getAttribute("attributeClass")!}">
    <a href="${localNextButtonUrl}" class="${localNextButtonClass}"><span>${localNextButtonDescription}</span></a>
  </div>
</#if>

<#assign localSubmitOrderButtonVisible = submitOrderButtonVisible!"N">
<#if localSubmitOrderButtonVisible == "Y">
 <div class="${request.getAttribute("attributeClass")!}">
  <input type="button" id="js_submitOrderBtn" name="submitOrderBtn" value="${uiLabelMap.SubmitOrderBtn}" onclick="javascript:submitCheckoutForm(document.${formName!}, 'SO', '');" class="standardBtn submitOrder" />
 </div>
</#if>
<input type="hidden" name="fbDoneAction" value="${doneAction!}"/>
    