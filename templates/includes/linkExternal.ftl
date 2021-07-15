[#assign targetLink=swValue.external ]
[#if !title?has_content]
    [#assign title = swValue.external!]
[/#if]


[#if !targetLink?has_content]
    [#assign resolveError = true]
[/#if]
