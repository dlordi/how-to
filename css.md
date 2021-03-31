## Colori di sistema

<table>
<tr><td style="font:menu;">ActiveBorder</td><td style="width:50%;border:1px solid black;background-color:ActiveBorder;">&nbsp;</td></tr>
<tr><td style="font:menu;">ActiveCaption</td><td style="width:50%;border:1px solid black;background-color:ActiveCaption;">&nbsp;</td></tr>
<tr><td style="font:menu;">AppWorkspace</td><td style="width:50%;border:1px solid black;background-color:AppWorkspace;">&nbsp;</td></tr>
<tr><td style="font:menu;">Background</td><td style="width:50%;border:1px solid black;background-color:Background;">&nbsp;</td></tr>
<tr><td style="font:menu;">ButtonFace</td><td style="width:50%;border:1px solid black;background-color:ButtonFace;">&nbsp;</td></tr>
<tr><td style="font:menu;">ButtonHighlight</td><td style="width:50%;border:1px solid black;background-color:ButtonHighlight;">&nbsp;</td></tr>
<tr><td style="font:menu;">ButtonShadow</td><td style="width:50%;border:1px solid black;background-color:ButtonShadow;">&nbsp;</td></tr>
<tr><td style="font:menu;">ButtonText</td><td style="width:50%;border:1px solid black;background-color:ButtonText;">&nbsp;</td></tr>
<tr><td style="font:menu;">CaptionText</td><td style="width:50%;border:1px solid black;background-color:CaptionText;">&nbsp;</td></tr>
<tr><td style="font:menu;">GrayText</td><td style="width:50%;border:1px solid black;background-color:GrayText;">&nbsp;</td></tr>
<tr><td style="font:menu;">Highlight</td><td style="width:50%;border:1px solid black;background-color:Highlight;">&nbsp;</td></tr>
<tr><td style="font:menu;">HighlightText</td><td style="width:50%;border:1px solid black;background-color:HighlightText;">&nbsp;</td></tr>
<tr><td style="font:menu;">InactiveBorder</td><td style="width:50%;border:1px solid black;background-color:InactiveBorder;">&nbsp;</td></tr>
<tr><td style="font:menu;">InactiveCaption</td><td style="width:50%;border:1px solid black;background-color:InactiveCaption;">&nbsp;</td></tr>
<tr><td style="font:menu;">InactiveCaptionText </td><td style="width:50%;border:1px solid black;background-color:InactiveCaptionText ;">&nbsp;</td></tr>
<tr><td style="font:menu;">InfoBackground</td><td style="width:50%;border:1px solid black;background-color:InfoBackground;">&nbsp;</td></tr>
<tr><td style="font:menu;">InfoText</td><td style="width:50%;border:1px solid black;background-color:InfoText;">&nbsp;</td></tr>
<tr><td style="font:menu;">Menu</td><td style="width:50%;border:1px solid black;background-color:Menu;">&nbsp;</td></tr>
<tr><td style="font:menu;">MenuText</td><td style="width:50%;border:1px solid black;background-color:MenuText;">&nbsp;</td></tr>
<tr><td style="font:menu;">Scrollbar</td><td style="width:50%;border:1px solid black;background-color:Scrollbar;">&nbsp;</td></tr>
<tr><td style="font:menu;">ThreeDDarkShadow</td><td style="width:50%;border:1px solid black;background-color:ThreeDDarkShadow;">&nbsp;</td></tr>
<tr><td style="font:menu;">ThreeDFace</td><td style="width:50%;border:1px solid black;background-color:ThreeDFace;">&nbsp;</td></tr>
<tr><td style="font:menu;">ThreeDHighlight</td><td style="width:50%;border:1px solid black;background-color:ThreeDHighlight;">&nbsp;</td></tr>
<tr><td style="font:menu;">ThreeDLightShadow</td><td style="width:50%;border:1px solid black;background-color:ThreeDLightShadow;">&nbsp;</td></tr>
<tr><td style="font:menu;">ThreeDShadow</td><td style="width:50%;border:1px solid black;background-color:ThreeDShadow;">&nbsp;</td></tr>
<tr><td style="font:menu;">Window</td><td style="width:50%;border:1px solid black;background-color:Window;">&nbsp;</td></tr>
<tr><td style="font:menu;">WindowFrame</td><td style="width:50%;border:1px solid black;background-color:WindowFrame;">&nbsp;</td></tr>
<tr><td style="font:menu;">WindowText</td><td style="width:50%;border:1px solid black;background-color:WindowText;">&nbsp;</td></tr>
</table>

## grid
```html
<style>
	.site {
		display: grid;
		grid-template-columns: 1fr 1fr;
		grid-template-rows: auto 1fr 3fr;
		grid-template-areas:
			"page-title page-title"
			"main-content masthead"
			"main-content sidebar"
			"footer footer"
	}

	.page-title {
		background: blue;
		grid-area: page-title;
	}

	.main-content {
		background: yellow;
		grid-area: main-content;
	}

	.masthead {
		background: red;
		grid-area: masthead;
	}

	.sidebar {
		background: green;
		grid-area: sidebar;
	}

	.footer {
		background: magenta;
		grid-area: footer;
	}

	@media screen and (min-width: 34em) {
		.site {
			grid-template-columns: 2fr 1fr 1fr;
			grid-template-areas:
				"page-title page-title page-title"
				"main-content masthead masthead"
				"main-content sidebar footer"
		}
	}
</style>

<div class="site">
	<h1 class="page-title">page-title</h1>
	<main class="main-content">main-content</main>
	<header class="masthead">masthead</header>
	<aside class="sidebar">sidebar</aside>
	<footer class="footer">footer</footer>
</div><!-- site -->
```

## Varie

- la dimensione di default dei font è `16px`

- unità di misura:
	- `em`: proporzione rispetto al tag padre
	- `rem`: proporzione rispetto al tag root (html)
