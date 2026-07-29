import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure DiffeomorphismGroup (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] where
  carrier : Set (M → M)
  smooth : Prop
  compositionClosed : Prop
  inverseClosed : Prop
  identityPresent : Prop
  smoothTerm : smooth
  compositionClosedTerm : compositionClosed
  inverseClosedTerm : inverseClosed
  identityPresentTerm : identityPresent

structure DiffeomorphismGroupEvidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] (G : DiffeomorphismGroup M) where
  smoothClosed : G.smooth
  compositionClosedClosed : G.compositionClosed
  inverseClosedClosed : G.inverseClosed
  identityPresentClosed : G.identityPresent

def DiffeomorphismGroupClosed (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] (G : DiffeomorphismGroup M) : Prop :=
  G.smooth ∧ G.compositionClosed ∧ G.inverseClosed ∧ G.identityPresent

theorem diffeomorphism_group_closed_from_evidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] (G : DiffeomorphismGroup M) (E : DiffeomorphismGroupEvidence M G) : DiffeomorphismGroupClosed M G := by
  exact And.intro E.smoothClosed (And.intro E.compositionClosedClosed (And.intro E.inverseClosedClosed E.identityPresentClosed))

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse