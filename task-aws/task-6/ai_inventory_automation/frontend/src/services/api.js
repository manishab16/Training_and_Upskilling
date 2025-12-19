export async function fetchInstances() {
const res = await fetch("http://localhost:8000/instances");
return res.json();
}