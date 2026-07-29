import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure DiffeomorphismGroupStructure (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] where
  carrier : Set (M ≃ M)
  compositionClosed : ∀ f g ∈ carrier, (f ∘ g) ∈ carrier
  identityIncluded : (Homeomorph.refl M) ∈ carrier
  inverseClosed : ∀ f ∈ carrier, f.symm ∈ carrier
  smoothCompatibility : ∀ f ∈ carrier, Differentiable ℝ f ∧ Differentiable ℝ f.symm

structure DiffeomorphismGroupEvidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] (D : DiffeomorphismGroupStructure M) where
  compositionClosedClosed : D.compositionClosed
  identityIncludedClosed : D.identityIncluded
  inverseClosedClosed : D.inverseClosed
  smoothCompatibilityClosed : D.smoothCompatibility

def DiffeomorphismGroupClosed (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] (D : DiffeomorphismGroupStructure M) : Prop :=
  D.compositionClosed ∧ D.identityIncluded ∧ D.inverseClosed ∧ D.smoothCompatibility

theorem diffeomorphism_group_closed_from_evidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] (D : DiffeomorphismGroupStructure M) (E : DiffeomorphismGroupEvidence M D) : DiffeomorphismGroupClosed M D := by
  exact And.intro E.compositionClosedClosed (And.intro E.identityIncludedClosed (And.intro E.inverseClosedClosed E.smoothCompatibilityClosed))

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse