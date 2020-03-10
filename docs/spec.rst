#######################
Annotator Specification
#######################

author: Viva Lambda
date: XX-XX-2020

Definitions
============

Annotation: 
:math:`A: S \to { (t, p) | t \subset T, 0 < p < 1}`
where T is the set of controlled terms, and p is probability

Raw Document - :math:`D_R`:
Either an Image or a Text document.

Annotated Document:
:math:`D_A = \{ A_1(s_1), A_2(s_2), ..., A_i(s_j) | s \in D_R \}`

Each annotation MUST be differentiable. Differentiation should not
come from timestamps or uuid or any other adhoc solution.
It should come as a result of annotation function. Basically,
all same input should map to same output.


Annotation Function
--------------------

Input: DocPart, terms, probability
Output: set of terms associated to a probability

1. take doc part
2. take terms
3. verify that no similar association occurs in the annotated document.
   The same doc part do not have any other probability associated to it.
   If there is already an association, raise an error
4. Associate the terms to doc part with a given probability
5. Add the association to annotated document


Change Annotation Function
---------------------------
Input: Annotation, newterms, newprobability, AnnotatedDocument
Output: AnnotatedDocument

1. check if newterm - new probability association occurs
  for any other document part
  if it does not occur: associate probability and new terms to docpart



Input - Output
---------------

Json


