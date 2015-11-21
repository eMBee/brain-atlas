as yet unclassified
initialize
	"open view for the mindmap and set up interactions"

	| view activenode prevnode |
	view := RTView new.


"shape := RTCompositeShape new.
shape allOfSameSizeWithPadding.
shape add: (RTBox new color: Color white; borderWidth: 2; borderColor: Color black).
shape add: (RTEditableLabel new height: 30)."

	view
		when: TRMouseClick
		do:
			[ :ev | 
			| label node edge |
			"node := shape element."
			label := RTEditableLabel new
				height: 30;
				text: '';
				element.
			node := RTBox new
				color: Color white;
				borderWidth: 2;
				borderColor: Color black;
				element.
			node @ RTDraggable.
			node when: TRMouseClick do: [ :click | activenode := click element ].
			node when: TRMouseDoubleClick do: [ label shape showTextMorphFor: label ].
			node when: TRMouseLeave do: [ label shape hideTextMorphFor: label ].
			view
				add: node;
				add: label.
			RTNest new
				stretchable;
				on: node nest: {label}.
			label trachelShape addCallback: (TRExtentCallback new block: [ :aShape :ratio | node trachelShape extent: aShape extent + (20 @ 0) ]).
			node translateTo: ev position.
			"label shape showTextMorphFor: label."
			(activenode notNil and: node ~= activenode)
				ifTrue: [ prevnode := activenode ].
			prevnode
				ifNotNil: [ edge := RTEdge from: prevnode to: node.
					edge
						+
							(RTBezierLine horizontal
								withContinuousRectangleAttachPoint;
								yourself).
					view add: edge ].
			prevnode := node.
			activenode := node.
			view signalUpdate ].
	^view.

	"RTEditableLabelTest new editableTextOneLine.
shape := RTCompositeShape new.
shape allOfSameSizeWithPadding.
shape add: (RTBox new color: Color white; borderWidth: 2; borderColor: Color black).
shape add: (RTEditableLabel new height: 30).

v := RTView new.
v add: (shape elementOn: 'hello') @ RTDraggable.
v"