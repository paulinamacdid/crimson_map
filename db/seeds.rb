# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"


puts "cleaning the database first..."

Review.destroy_all
Favourite.destroy_all
Facility.destroy_all
User.destroy_all
Blog.destroy_all

puts "creating users..."

gabriela = User.create(email: "gabbyb@gmail.com", password: "123456", first_name: "Gabriela", last_name: "Propodopolis", age: 24)
pamela = User.create(email: "pamela@gmail.com", password: "123456", first_name: "Pamela", last_name: "Gordon", age: 34)
ivy = User.create(email: "ivy@gmail.com", password: "123456", first_name: "Ivy", last_name: "Johnson", age: 29)
melissa = User.create(email: "mel123@gmail.com", password: "123456", first_name: "Melissa", last_name: "Walter", age: 42)
abi = User.create(email: "abi123@gmail.com", password: "123456", first_name: "Abi", last_name: "Blenson", age: 46)

puts "creating facilities..."
oru = Facility.create!(address: "6 Virginia Close, KT3 3RB New Malden",
                      business_owner: false,
                      rating: 4.0,
                      toilet: true,
                      sanitary_products: true,
                      baby_change: true,
                      quiet_place: true,
                      education: false,
                      name: "Oru",
                      opening_hours: "Open 08:30 - 16:00",
                      user: melissa,
                      image: "https://images.squarespace-cdn.com/content/v1/63d2989b2d4c0421d7d241d5/e002a445-b5a6-46a9-bd85-8c5e1033ded2/SRG_Oru_SUTTON_CROWDFUNDER_ORIGINAL-22.jpg")
sutton_library = Facility.create!(address: "St Nicholas Way, Sutton SM1 1EA",
                                  business_owner: false,
                                  rating: 4.0,
                                  toilet: true,
                                  sanitary_products: true,
                                  baby_change: true,
                                  quiet_place: true,
                                  education: true,
                                  name: "Sutton Library",
                                  opening_hours: "Open 09:00 - 17:00",
                                  user: melissa,
                                  image: "https://thedesignconcept.co.uk/media/24274/sutton_uk_006.jpg?mode=pad&width=1350&height=900&bgcolor=ffffff&rnd=131835698170000000")
dobbies = Facility.create!(address: "28 Willow Rd, New Malden KT3 3RS",
                          business_owner: true,
                          rating: 4,
                          toilet: true,
                          sanitary_products: false,
                          baby_change: true,
                          quiet_place: false,
                          education: false,
                          name: "Dobbies",
                          opening_hours: "Open 08:00 - 16:30",
                          user: melissa,
                          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPx6DmpdKa_5OLtnPCfyzPE2BxTTPgFFzvlQ&s")
carshalton_station = Facility.create!(address: "Carshalton SM5 2HW",
  business_owner: false,
  rating: 2,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Carshalton Station",
  opening_hours: "Open 06:00 - 00:00",
  user: melissa,
  image: "https://upload.wikimedia.org/wikipedia/commons/0/0e/Carshalton_Railway_Station_-_geograph.org.uk_-_1553600.jpg")
british_library = Facility.create!(address: "96 Euston Rd., London NW1 2DB",
  business_owner: true,
  rating: 4.5,
  toilet: true,
  sanitary_products: false,
  baby_change: true,
  quiet_place: true,
  education: true,
  name: "British Library",
  opening_hours: "Open 09:30 - 20:00",
  user: melissa,
  image: "https://wp.inews.co.uk/wp-content/uploads/2017/10/shutterstock_554370322-e1507803540641.jpg")
pret = Facility.create!(address: "Kingston Rd, New Malden KT3 3RX",
  business_owner: true,
  rating: 1,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Pret",
  user: ivy,
  opening_hours: "Open 07:30 - 19:00",
  image: "https://www.londondesigneroutlet.com/wp-content/uploads/2023/06/pret-a-manger-london-designer-outlet-00.jpg",)
bella_caffe = Facility.create!(address: "150 Kingston Rd, New Malden KT3 3RD",
  business_owner: false,
  rating: 2,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Bella Caffe",
  user: ivy,
  opening_hours: "Open 06:30 - 04:30",
  image: "https://lh3.googleusercontent.com/p/AF1QipOtzldFQ0ivO1zohl36AB_8C76qLNJ9DZAan5Pg=s1360-w1360-h1020",
)
mad_coffee_bar = Facility.create!(address: "61 Lind Rd, Sutton SM1 4PP",
  business_owner: false,
  rating: 4,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Mad Coffee Bar",
  user: ivy,
  opening_hours: "Open 07:00 - 18:00",
  image: "https://lh3.googleusercontent.com/p/AF1QipO0sIu4qAJU3iGkq10gPJRyPQ5M7nhGYr3AgqJb=s1360-w1360-h1020",
)
the_grove_womens_toilets = Facility.create!(address: "Carshalton SM5 3BB",
  business_owner: false,
  rating: 1.5,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "The Grove Women's Toilets",
  opening_hours: "Open 00:00 - 00:00",
  user: ivy,
  image: "https://lh3.googleusercontent.com/p/AF1QipP7MkzZJd4wNNEHwELw-ureDD_cgvvLXGHrzvwC=s1360-w1360-h1020",
)
public_toilet_free = Facility.create!(address: "97 Banstead Rd, Carshalton SM5 3NP",
  business_owner: false,
  rating: 3,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Public Toilet £0 Free (Male / Female)",
  opening_hours: "Open 16:00 - 22:30",
  user: ivy,
  image: "https://lh3.googleusercontent.com/p/AF1QipOlWxA422fEgK500xx2_JvtbbFzqNh_v0sPx6GV=s1360-w1360-h1020",)
pulse_health_and_fitness = Facility.create!(address: "Nightingale Rd, Carshalton SM5 2EJ",
  business_owner: false,
  rating: 3,
  toilet: false,
  sanitary_products: true,
  baby_change: true,
  quiet_place: false,
  education: false,
  name: "Pulse Health & Fitness",
  opening_hours: "Open 06:30 - 21:00",
  user: ivy,
  image: "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/10/Pulse-Carshalton-193-scaled.jpg",
)
sheenas_free_little_library = Facility.create!(address: "51 Windsor Ave, New Malden KT3 5HE",
  business_owner: false,
  rating: 3.5,
  toilet: true,
  sanitary_products: true,
  baby_change: true,
  quiet_place: true,
  education: true,
  name: "Sheena’s Free Little Library",
  opening_hours: "Open 07:00 - 19:30",
  user: ivy,
  image: "https://lh3.googleusercontent.com/p/AF1QipOtmli6c8lQU3xCFMBAWpODAoZRNMqXuXCwl867=s1360-w1360-h1020",)

puts "done, created #{Facility.count} facilities"

puts "creating reviews..."

Review.create!(comment: "Toilet works fine, but lacks comfort and features. Could definitely be improved.", rating: 3, facility: oru, user: gabriela)
Review.create!(comment: "Great toilet, always clean, but disappointed the free sanitary products were out last time.", rating: 3, facility: sutton_library, user: pamela)
Review.create!(comment: "What a lovely little library with free organic sanitary products. Sheena, the owner, even offered me a free hot chocolate. It was such a welcoming touch I'll definitely be back", rating: 5, facility: sheenas_free_little_library, user: pamela)
Review.create!(comment: "a surprisingly gorgeous spot to change sanitary products, great ambience, very clean, many toilets", rating: 4, facility: british_library, user: ivy)

puts "creating blogs..."

Blog.create!(title: "Endometriosis at work", content_preview: "One in six people with endometriosis have to leave the workplace and is a condition that costs the economy £8.2 billion per year in loss of work and healthcare costs.
                      This is unacceptable- nobody should face discrimination at work or risk losing their job because of their endometriosis, and we’re determined to work with the Government...", content: "One in six people with endometriosis have to leave the workplace and is a condition that costs the economy £8.2 billion per year in loss of work and healthcare costs.
                      This is unacceptable- nobody should face discrimination at work or risk losing their job because of their endometriosis, and we’re determined to work with the Government to ensure they protect those with menstrual health conditions in the new Bill.
                      Earlier this month, the Government introduced an Employment Rights Bill that aims to cut down on unfair working practices. Endometriosis UK welcomes the Bill, including measures to support those going through the menopause. But the Bill must go further to ensure measures are introduced to ensure those with endometriosis have the support and protections they need in the workplace.
                      Over the coming weeks and months, Endometriosis UK will be lobbying for changes to the Employment Rights Bill to ensure all those with menstrual health conditions, including endometriosis, have access to the support they need at work. We would like to see:
                      Menopause action plans extended to all those impacted by menstrual health conditions including endometriosis
                      Legislation to ensure workers with menstrual health conditions are treated fairly if they need short but intermittent time off work, as a result of their condition.
                      The Bill is due to receive its second reading in the House of Commons this afternoon (Monday 21st October 2024).
                      You can support the campaign by emailing your MP. Our easy-to-use template will generate an email to your MP using your postcode.",
                      author: "Sally Campbell", image: "https://www.endometriosis-uk.org/sites/default/files/2024-08/Endometriosis%20UK%20%282%29.png", url: "https://www.endometriosis-uk.org/new-campaign-endometriosis-work")

Blog.create!(title: "Faster Diagnosis for Endometriosis", content_preview: "According to the Royal College of nursing it takes women an average of 7.5 years from the onset of symptoms to an official diagnosis with Endometriosis. In my case no-one ever told me that periods are actually not supposed to be painful. Having the occasional painful period in my teens, it got worse and worse over time. I did not think much of it, it’s part of being a woman, right? At least that’s what they told us back in the nineties.
                      In the UK and most likely also globally, however, about ten percent of women suffer from Endometriosis, a painful chronic health condition caused by  tissue similar to the lining of the uterus growing outside of the uterus. So how do you get a diagnosis quickly, without having to wait over seven years...", content: "According to the Royal College of nursing it takes women an average of 7.5 years from the onset of symptoms to an official diagnosis with Endometriosis. In my case no-one ever told me that periods are actually not supposed to be painful. Having the occasional painful period in my teens, it got worse and worse over time. I did not think much of it, it’s part of being a woman, right? At least that’s what they told us back in the nineties.
                      In the UK and most likely also globally, however, about ten percent of women suffer from Endometriosis, a painful chronic health condition caused by  tissue similar to the lining of the uterus growing outside of the uterus. So how do you get a diagnosis quickly, without having to wait over seven years. Let me share my experience:

                      1.	See a doctor
                      This might sound silly, but a lot of women ignore pain when on their period. GPs are a central point of referral whenever we have health issues. They deal with a vast amount of different diseases and therefore look at the bigger picture. If you have doubts about being in a lot of pain while on your period, go and see your GP! They can give you pain medication to help you with the symptoms and refer you to a more specialised service. If your period pain makes you pass out or incapacitates you, it is a sign. You have the right to go to hospital and get some strong painkillers if it gets really bad.

                      2.	Be persistent
                      If a GP is dismissive and tells you that as long as you manage the pain it is all a-okay, you do not have to believe them. You can get a second opinion! But do not let them send you home without help. Pain is a natural reaction of the body that indicates that something is not okay, it should not be ignored. And by now, we should all know that pain during your period is a sign that something is wrong. Maybe the practice you go to has several doctors - request an appointment with one of the other practitioners. If you are unhappy with the health service of your current GP, you have the right to see another doctor. Trust your gut feeling, if someone is really dismissive or does not take you seriously, they might not be the right person to help you. But do not ignore pain and suffer in silence!

                      3.	Be informed
                      I would highly recommend doing your own research before going to see a doctor. Keep track of your periods and when the pain occurs, if you give a more detailed account of your pain and symptoms, the chances are that you will be taken more seriously. Ask explicitly about Endometriosis as the cause of pain. Sometimes it helps to point doctors in a certain direction in order to get a faster referral for diagnostics or a specialist. If you do not want to jump on a random treatment but want to see a specialist, it helps to have relevant information in order to insist on a referral.

                      4.	Don’t be disheartened
                      Usually, the GP will send you for an ultrasound. But a lot of cases of Endometriosis are not detected by ultrasound because it will only pick up large clumps of scar tissue or cysts. The ultrasound only provides a picture from within the uterus, so in cases where the Endometriosis has grown outside of it or is in less accessible places or even worse has grown into organs like the bladder, ureter, bowels or kidneys the scan will come back negative. Your pain however is still real and you deserve to find out the cause of it. Just because an ultrasound comes back without any result or diagnosis, does not mean your pain is not real.

                      5.	See a specialist
                      If you see your GP to discuss the results of an ultrasound and they say “We can’t do anything else for you” - it is time to see a specialist. If the doctor does not offer to refer you, ask for a referral to see a gynaecologist. They will be able to have a closer look at what is wrong and can get you other scans such as an MRI. Most cases of Endometriosis are only definitively diagnosed by surgery in which parts of it can be removed and your symptoms can be eased. It is a surgery that uses small incisions to insert the medical instruments and has very low rates of complications. If you decide against surgery the specialist can make a targeted treatment plan to help you manage your symptoms and give you the right hints towards an effective hormonal treatment.

                      6.	Be prepared
                      Oh boy, this counts for so many situations when you face a chronic illness. The list is long: Keep track of your periods, do not leave the house without pain killers when you know your period or ovulation will start soon, make sure you protect your stomach when taking large amounts of Ibuprofen to cope with excruciating pain (your doctor should be able to give you medication to protect your tummy!)... Most importantly when getting diagnosed though, write a list of questions to ask when seeing a gynaecologist or Endometriosis specialist. Seeing doctors can be stressful, so come prepared and do not let them rush you out of the door - ask all those questions! It all can be overwhelming, but preparing yourself will make it easier and give you the confidence to handle it all.

                      I hope this little list helps and encourages more women to get help for their pain. It took me one and a half years from first seeing my GP to getting an official diagnosis, but I suffered through years of unspecific pain in my legs, problems with my digestion and period cramps until it got so bad I could not bear it any more. Don’t let it get to that point but act faster and claim your normal life back!
                      ",
                      author: "Dorothea Toeller", image: "https://images.everydayhealth.com/images/seo-graphic-content-initiative/eh-how-endometriosis-affects-the-body-seo-graphic-gs.png?sfvrsn=a318d72f_3", url: "https://www.endometriosis-uk.org")

Blog.create!(title: "The Silent Transition: Discussing Perimenopause ", content_preview: "Women’s health has long stood in the shadows of medical research, lagging behind male-focused health treatment in ways that have left a lasting impact on half the population. Historically, health research and medical treatments were predominantly based on men’s physiology, with women’s unique health needs often relegated to secondary importance or outright ignored.
                      For centuries, topics such as menstruation, pregnancy, and menopause have been shrouded in silence, often discussed in hushed tones or labelled “women’s issues” rather than vital health concerns. These taboos have contributed to a dangerous gap in education and awareness. Many still struggle to identify symptoms of perimenopause, mistaking them for stress, aging, or other unrelated conditions.
                      A History of Gender Bias in Health Research...", content: "Women’s health has long stood in the shadows of medical research, lagging behind male-focused health treatment in ways that have left a lasting impact on half the population. Historically, health research and medical treatments were predominantly based on men’s physiology, with women’s unique health needs often relegated to secondary importance or outright ignored.
                      For centuries, topics such as menstruation, pregnancy, and menopause have been shrouded in silence, often discussed in hushed tones or labelled “women’s issues” rather than vital health concerns. These taboos have contributed to a dangerous gap in education and awareness. Many still struggle to identify symptoms of perimenopause, mistaking them for stress, aging, or other unrelated conditions.
                      A History of Gender Bias in Health Research
                      For much of history, medical research has treated the male body as the default, leaving the female body largely understudied. From the late 19th century to the mid-20th century, women were often excluded from clinical trials. Researchers claimed that women’s hormonal cycles made data too complicated to analyse, and concerns over the impact of studies on potential pregnancies also fuelled exclusion1. This male-centric approach persisted even when studying conditions that affect both genders, leading to diagnostic disparities. For example, cardiovascular disease—long thought to be predominantly a male problem—presents differently in women, yet it took years of underdiagnosis and higher mortality rates among women before it was taken seriously2.
                      Women’s health was relegated to the domain of reproductive function, as if their bodies were solely valuable for procreation. Yet the cultural stigma around female bodies has compounded the medical neglect. Menstruation, pregnancy, and menopause remain taboo subjects in many cultures. This makes it difficult for women to talk openly about the changes they experience, even with their doctors.
                      This taboo extends to perimenopause, the transitional phase before menopause, which can begin as early as a woman's mid-30s or as late as her 50s. Since many women are unfamiliar with what perimenopause entails, they often don’t recognise its symptoms. A history of medical disregard means many women don’t seek professional attention, leaving countless women without proper support or treatment during a critical phase of their lives.
                      What Is Perimenopause?
                      Perimenopause is the period during which a woman’s body begins to transition toward menopause. It’s marked by fluctuating hormone levels—primarily oestrogen and progesterone—as the ovaries gradually produce less oestrogen. Perimenopause can last anywhere from several months to up to a decade before a woman reaches full menopause, which is defined as 12 consecutive months without a menstrual period.
                      The hormonal shifts during perimenopause can bring about a range of physical, emotional, and psychological symptoms. Yet because many of these symptoms can also be linked to other life factors—like stress or aging—many women are unaware that perimenopause is the root cause.
                      Common Symptoms
                      During perimenopause, women experience a variety of symptoms driven by hormonal fluctuations, many of which can be misdiagnosed. Periods may become irregular, and hot flashes or night sweats are common, often disrupting sleep and leaving women feeling fatigued. Mood swings, irritability, and feelings of anxiety or depression can intensify, adding to the emotional challenges of this transitional phase. Many women report developing new allergies, and, oddly, getting itchy ears due to dry skin.
                      As oestrogen levels decline, women begin to lose bone density at a faster rate, which can increase the risk of osteoporosis and fractures later in life. Muscle mass also tends to decrease, leading to reduced strength and a slower metabolism, which can contribute to weight gain. Cognitive changes, such as memory lapses or difficulty concentrating—commonly referred to as brain fog—are another challenging aspect of perimenopause. These cognitive shifts can leave women feeling mentally sluggish, making it harder to stay focused or recall information, which can be unsettling in both personal and professional contexts.
                      Treatment and Management Options
                      There are several approaches to managing perimenopause, depending on the severity of symptoms and individual needs. Hormone therapy (HT) is one option for women experiencing significant discomfort, as it can help regulate fluctuating hormone levels and alleviate issues like hot flashes, night sweats, and vaginal dryness. However, it's not suitable for everyone, and discussing the potential risks and benefits with a healthcare provider is essential.
                      For those who prefer or require non-hormonal options, certain medications, such as low-dose antidepressants, can help reduce symptoms like hot flashes and mood changes. Lifestyle changes are also highly effective in managing perimenopause. Regular exercise, especially weight-training, is crucial to maintain muscle and bone density. Reducing caffeine and alcohol helps improve sleep and reduces the frequency and intensity of hot flashes.
                      Breaking the Silence Around Perimenopause
                      Perimenopause, like many stages of a woman’s life, has been misunderstood and under-discussed for far too long. Greater awareness and education not only empower female patients, but they also help healthcare professionals. As more attention and funding go toward research and training, doctors and medical staff will be better equipped to correctly diagnose and treat perimenopause.
                      Encouraging open conversations about perimenopause in healthcare settings and in daily life with friends and family is key to dismantling the shame or uncertainty that surrounds this natural phase. The more we talk about perimenopause and other important women’s health issues, the more we will see improvements in treatment options, support systems, and overall understanding.
                      In the meantime, women must continue to advocate for themselves—pushing past societal discomfort to voice their health concerns and demand the care they deserve. Shining a light on these issues will benefit not only women navigating perimenopause but will also bring us closer to achieving equality in healthcare, ensuring that women can thrive at every stage of their lives.

                      1 Institute of Medicine (US) Committee on the Ethical and Legal Issues Relating to the Inclusion of Women in Clinical Studies. (1994). Women and Health Research: Ethical and Legal Issues of Including Women in Clinical Studies, Volume 1. National Academies Press.
                      2 U.S. General Accounting Office. (1990). NIH Research: Problems in Implementing Policy on Women in Study Populations.",

                      author: "Alba Cobas", image: "https://images.squarespace-cdn.com/content/v1/5566620be4b0f5a055effbe7/565cb603-8413-43cf-acbc-018c1d3d4d2d/Coming+to+terms+with+grief+and+loss+of+youth+and+fertility+not+having+children%2C+feeling+trapped+and+coping+with+anger+and+rage+at+others+in+menopause+during+midlife+with+extra+responsibilities.+Seek+tips+and+help+from+counselling+psychologist+Joanne+Collyer+in+Subiaco+Perth.png", url: "https://www.health.harvard.edu/womens-health/perimenopause-rocky-road-to-menopause")

puts "done, created #{Blog.count} blog"

api_token = ENV['GOOGLE_API_KEY']
url = "https://places.googleapis.com/$discovery/rest?version=v1&key=#{api_token}"
facilities_serialized = URI.parse(url).read
places = JSON.parse(facilities_serialized)

puts places
# places["places"].each do |place|
#   Facility.create!(name: place["places"], address:, opening_hours:, toilet: )
# # end
