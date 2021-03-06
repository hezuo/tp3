﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Pacifico.Interfaces.CustomHtmlHelpers
{
    public static class CustomHtmlHelpers
    {
        public static IHtmlString ActionLinkNonEncoded(this HtmlHelper htmlHelper, string linkText,
                        object routeValues, object htmlAttributes)
        {
            return ActionLinkNonEncoded(htmlHelper, linkText, null, null, routeValues, htmlAttributes);
        }

        public static IHtmlString ActionLinkNonEncoded(this HtmlHelper htmlHelper, string linkText,
                        string action, object routeValues, object htmlAttributes)
        {
            return ActionLinkNonEncoded(htmlHelper, linkText, action, null, routeValues, htmlAttributes);
        }

        /// <summary>
        /// HTML Extension method to support Bootstrap icon with text in ActionLink. For example
        /// @Html.ActionLinkNonEncoded("<i class=\"icon-edit\"></i>", "ActionName", "Controller",
        ///                             new { parameter = parameterValue },
        ///                             new { id = "btnName", @class = "btn btn-success" })
        /// Important Note: Please provide link of icon as: <i class=\"icon-edit\"></i> NOT <i class=\"icon-edit\" />. NOTE: no <i />.
        /// Concept Credits: http://bloggingabout.net/blogs/rick/archive/2012/11/07/how-to-create-an-actionlink-with-a-twitter-bootstrap-icon-in-mvc4.aspx
        /// </summary>
        /// <param name="htmlHelper"></param>
        /// <param name="linkText"></param>
        /// <param name="action"></param>
        /// <param name="controller"></param>
        /// <param name="routeValues"></param>
        /// <param name="htmlAttributes"></param>
        /// <returns></returns>
        public static IHtmlString ActionLinkNonEncoded(this HtmlHelper htmlHelper, string linkText,
                        string action, string controller, object routeValues, object htmlAttributes)
        {
            TagBuilder tagBuilder;
            UrlHelper urlHelper;

            urlHelper = new UrlHelper(htmlHelper.ViewContext.RequestContext);
            tagBuilder = new TagBuilder("a");

            tagBuilder.InnerHtml = linkText;

            tagBuilder.Attributes["href"] = urlHelper.Action(action, controller, routeValues);

            tagBuilder.MergeAttributes(new RouteValueDictionary(htmlAttributes));

            return MvcHtmlString.Create(tagBuilder.ToString());
        }

    }
}