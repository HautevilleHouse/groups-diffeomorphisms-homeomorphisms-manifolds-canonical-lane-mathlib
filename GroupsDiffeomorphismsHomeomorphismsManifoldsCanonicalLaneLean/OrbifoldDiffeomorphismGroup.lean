import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure OrbifoldDiffeomorphismGroup (X : Type u) [TopologicalSpace X] [ChartedSpace ℝ X] where
  orbifoldStructure : Set (Set X)
  diffeomorphismGroup : DiffeomorphismGroupStructure X
  compatibility : ∀ U ∈ orbifoldStructure, ∀ g ∈ diffeomorphismGroup.carrier, g '' U ∈ orbifoldStructure

structure OrbifoldDiffeomorphismGroupEvidence (X : Type u) [TopologicalSpace X] [ChartedSpace ℝ X] (O : OrbifoldDiffeomorphismGroup X) where
  diffeomorphismGroupClosed : DiffeomorphismGroupClosed X O.diffeomorphismGroup
  compatibilityClosed : O.compatibility

def OrbifoldDiffeomorphismGroupClosed (X : Type u) [TopologicalSpace X] [ChartedSpace ℝ X] (O : OrbifoldDiffeomorphismGroup X) : Prop :=
  DiffeomorphismGroupClosed X O.diffeomorphismGroup ∧ O.compatibility

theorem orbifold_diffeomorphism_group_closed_from_evidence (X : Type u) [TopologicalSpace X] [ChartedSpace ℝ X] (O : OrbifoldDiffeomorphismGroup X) (E : OrbifoldDiffeomorphismGroupEvidence X O) : OrbifoldDiffeomorphismGroupClosed X O := by
  exact And.intro E.diffeomorphismGroupClosed E.compatibilityClosed

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse