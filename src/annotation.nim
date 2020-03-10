## Author: Viva Lambda
## License: see, LICENSE

import sequtils

type
    DocPart = object
        content: string

type
    Term = object
        value: string

type
    Annotation = object
        terms: seq[Term]
        probability: float
        doc: DocPart

type
    AnnotatedDocument = object
        content: seq[Annotation]

proc annotate(dpart: DocPart, terms: seq[Term],
              probability: float, adoc: AnnotatedDocument): AnnotatedDocument =
    ## dpart: a document part that is deemed to be worthy of
    ## annotation
    ## terms: a set of terms that are going to be associated to
    ## document parts
    ## probability: a value between (0, 1.0)
    ## adoc: final annotated document which contains every annotation
    var check = true
    var newcont: seq[Annotation]
    for anno in adoc.content.items():
        if dpart == anno.doc:
            check = false
        if terms == anno.terms and probability == anno.probability:
            check = false
        newcont.add(anno)
    #
    if check == true:
        let an = Annotation(doc: dpart, terms: terms,
                            probability: probability)
        newcont.add(an)

    return AnnotatedDocument(content: newcont)

proc changeAnnotation(anno: Annotation, pos: int, terms: seq[Term], prob: float,
                      adoc: AnnotatedDocument): AnnotatedDocument =
    ## anno: an annotation
    ## terms: a set of terms that are going to be associated to
    ## document parts
    ## probability: a value between (0, 1.0)
    ## adoc: final annotated document which contains every annotation
    var check = true
    var newcont: seq[Annotation]
    for an in adoc.content.items():
        if terms == an.terms and prob == an.probability:
            check = false
        newcont.add(an)
    #
    newcont.delete(pos)
    if check == true:
        let ann = Annotation(doc: anno.doc, terms: terms, probability: prob)
        newcont.insert(@[ann], pos)
    return AnnotatedDocument(content: newcont)


