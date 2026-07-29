import GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure DifferentiableStructurePackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothAtlas : Set (Set manifold → manifold)
  maximalAtlas : Prop
  smoothTransitionFunctions : Prop

def DifferentiableStructureClosed (P : DifferentiableStructurePackage) : Prop :=
  P.maximalAtlas ∧ P.smoothTransitionFunctions

theorem differentiable_structure_closed_from_evidence (P : DifferentiableStructurePackage) (hmax : P.maximalAtlas) (htrans : P.smoothTransitionFunctions) : DifferentiableStructureClosed P := by
  exact And.intro hmax htrans

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse