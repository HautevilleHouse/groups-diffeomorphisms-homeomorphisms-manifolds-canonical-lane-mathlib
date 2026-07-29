import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure ManifoldSubgroupPackage {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    (G : DiffeomorphismGroupPackage M) where
  subgroupSet : Set (Type v)
  closedUnderOperation : Prop
  containsIdentity : Prop
  closedUnderInversion : Prop
  smoothSubmanifoldStructure : Prop

structure ManifoldSubgroupEvidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} (S : ManifoldSubgroupPackage G) where
  closedUnderOperationClosed : S.closedUnderOperation
  containsIdentityClosed : S.containsIdentity
  closedUnderInversionClosed : S.closedUnderInversion
  smoothSubmanifoldStructureClosed : S.smoothSubmanifoldStructure

def ManifoldSubgroupClosed {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} (S : ManifoldSubgroupPackage G) : Prop :=
  S.closedUnderOperation ∧ S.containsIdentity ∧
  S.closedUnderInversion ∧ S.smoothSubmanifoldStructure

theorem manifold_subgroup_closed_from_evidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} (S : ManifoldSubgroupPackage G)
    (E : ManifoldSubgroupEvidence S) : ManifoldSubgroupClosed S := by
  exact And.intro E.closedUnderOperationClosed
    (And.intro E.containsIdentityClosed
      (And.intro E.closedUnderInversionClosed E.smoothSubmanifoldStructureClosed))

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse
