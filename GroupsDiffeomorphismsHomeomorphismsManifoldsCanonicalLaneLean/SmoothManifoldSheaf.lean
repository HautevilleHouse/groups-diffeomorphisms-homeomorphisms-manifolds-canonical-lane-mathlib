import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure SmoothManifoldSheaf (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] where
  openCover : Set (Set M)
  charts : ∀ U ∈ openCover, (U → ℝ^3)
  transitionSmooth : ∀ U V ∈ openCover, ∀ x ∈ U ∩ V, DifferentiableAt ℝ (charts V x ∘ (charts U x)⁻¹) (charts U x)
  covering : ⋃₀ openCover = Set.univ

structure SmoothManifoldSheafEvidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] (S : SmoothManifoldSheaf M) where
  transitionSmoothClosed : S.transitionSmooth
  coveringClosed : S.covering

def SmoothManifoldSheafClosed (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] (S : SmoothManifoldSheaf M) : Prop :=
  S.transitionSmooth ∧ S.covering

theorem smooth_manifold_sheaf_closed_from_evidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] (S : SmoothManifoldSheaf M) (E : SmoothManifoldSheafEvidence M S) : SmoothManifoldSheafClosed M S := by
  exact And.intro E.transitionSmoothClosed E.coveringClosed

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse