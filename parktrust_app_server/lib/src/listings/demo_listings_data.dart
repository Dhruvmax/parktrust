// Demo spaces copied from the old ParkTrust app's database (rates converted from paise to rupees).
// Row: title, description, area, address, lat, lng, ratePerHour(Rs), capacity, ev, cctv, covered, gated
const demoListingRows = <List<Object?>>[
  ["Covered garage, Lane 5", "Private covered garage with CCTV and an EV charger. Gated entry.", "Koregaon Park", "Lane 5, Koregaon Park, Pune 411001", 18.5362, 73.8938, 60, 2, 1, 1, 1, 1],
  ["Mall-side driveway", "Wide private driveway, five minutes from the mall.", "Viman Nagar", "Near Phoenix Marketcity, Viman Nagar, Pune 411014", 18.5679, 73.9143, 40, 1, 0, 1, 0, 0],
  ["Home driveway near Fergusson College", "Safe residential lane, close to FC Road restaurants and shops.", "FC Road", "Off FC Road, Shivajinagar, Pune 411004", 18.5236, 73.8412, 50, 1, 0, 0, 0, 0],
  ["Office basement, Hinjewadi Phase 1", "Basement parking with security. Monthly passes for office staff.", "Hinjewadi", "Rajiv Gandhi Infotech Park Phase 1, Pune 411057", 18.5912, 73.7389, 30, 12, 0, 1, 1, 1],
  ["Society visitor parking, Paud Road", "Housing society with a managed visitor bay. Residents can invite guests.", "Kothrud", "Paud Road, Kothrud, Pune 411038", 18.5074, 73.8077, 35, 6, 0, 1, 0, 1],
  ["Balewadi High Street driveway", "Great for evenings on the High Street.", "Baner", "Balewadi High Street, Baner, Pune 411045", 18.559, 73.7868, 70, 2, 0, 1, 0, 0],
  ["Covered bay near MG Road", "Covered bay in the heart of the Camp shopping area.", "Camp", "East Street, Camp, Pune 411001", 18.5167, 73.8793, 80, 3, 0, 1, 1, 1],
  ["Court Road lane parking", "Quiet lane behind the court complex.", "Shivajinagar", "Court Road, Shivajinagar, Pune 411005", 18.5314, 73.8446, 55, 1, 0, 0, 0, 0],
  ["ITI Road shaded spot", "Shaded spot under a covered porch.", "Aundh", "ITI Road, Aundh, Pune 411007", 18.558, 73.8075, 35, 2, 0, 0, 1, 0],
  ["EV-ready lane, Kalyani Nagar", "Two bays with a 7 kW charger. Gated.", "Kalyani Nagar", "Lane 6, Kalyani Nagar, Pune 411006", 18.5463, 73.9033, 65, 2, 1, 1, 0, 1],
  ["Society lot, Wakad", "Residential society lot with guard on duty.", "Wakad", "Datta Mandir Road, Wakad, Pune 411057", 18.5987, 73.7609, 30, 4, 0, 1, 0, 1],
  ["Magarpatta open lot", "Large lot with lighting and CCTV.", "Magarpatta", "Magarpatta City, Hadapsar, Pune 411013", 18.5158, 73.9272, 45, 8, 0, 1, 0, 1],
  ["Wedding-hall overflow plot", "Open plot used for event overflow. Prices rise on event days.", "Deccan", "JM Road, Deccan Gymkhana, Pune 411004", 18.5167, 73.8418, 90, 15, 0, 0, 0, 0],
  ["Two-wheeler bay, Swargate", "Bike-only covered bay by the bus stand.", "Swargate", "Near Swargate bus stand, Pune 411042", 18.5018, 73.8636, 20, 10, 0, 1, 1, 0],
];
