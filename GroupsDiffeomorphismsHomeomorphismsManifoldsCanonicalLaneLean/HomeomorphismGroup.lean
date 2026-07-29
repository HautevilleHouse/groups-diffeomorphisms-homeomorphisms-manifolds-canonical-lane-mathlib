import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure HomeomorphismGroup (M : Type u) [TopologicalSpace M] where
  carrier : Set (M → M)
  continuous : Prop
  continuousInverse : Prop
  compositionClosed : Prop
  inverseClosed : Prop
  identityPresent : Prop
  continuousTerm : continuous
  continuousInverseTerm : continuousInverse
  compositionClosedTerm : compositionClosed
  inverseClosedTerm : inverseClosed
  identityPresentTerm : identityPresent

structure HomeomorphismGroupEvidence (M : Type u) [TopologicalSpace M] (G : HomeomorphismGroup M) where
  continuousClosed : G.continuous
  continuousInverseClosed : G.continuousInverse
  compositionClosedClosed : G.compositionClosed
  inverseClosedClosed : G.inverseClosed
  identityPresentClosed : G.identityPresent

def HomeomorphismGroupClosed (M : Type u) [TopologicalSpace M] (G : HomeomorphismGroup M) : Prop :=
  G.continuous ∧ G.continuousInverse ∧ G.compositionClosed ∧ G.inverseClosed ∧ G.identityPresent

theorem homeomorphism_group_closed_from_evidence (M : Type u) [TopologicalSpace M] (G : HomeomorphismGroup M) (E : HomeomorphismGroupEvidence M G) : HomeomorphismGroupClosed M G := by
  exact And.intro E.continuousClosed (And.intro E.continuousInverseClosed (And.intro E.compositionClosedClosed (And.intro E.inverseClosedClosed E.identityPresentClosed)))

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse