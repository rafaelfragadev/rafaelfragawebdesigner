$html = [System.IO.File]::ReadAllText("index.html")

# Find the parts
$navIndex = $html.IndexOf('<div class="navbar w-nav"')
$headPart = $html.Substring(0, $navIndex)

$heroIndex = $html.IndexOf('<div class="home-header_component">')
$originalNav = $html.Substring($navIndex, $heroIndex - $navIndex)

$aboutIndex = $html.IndexOf('<div class="section_home-about">')
$heroPart = $html.Substring($heroIndex, $aboutIndex - $heroIndex)

$scriptIndex = $html.IndexOf('<script src="assets/jquery-3_44caadb843d5.js"')
$footerScripts = $html.Substring($scriptIndex)

# Build custom nav based on original
$customNav = $originalNav -replace '<div class="navbar_brand-text"><strong class="logo-bold">THIAGO</strong>WORKS</div>', '<div class="navbar_brand-text"><strong class="logo-bold">DESIGN</strong>SYSTEM</div>' -replace '<a aria-current="page" class="navbar_link w--current" href="#">Home</a><a class="navbar_link" href="#">Work</a><a class="navbar_link" href="#">About</a>', '<a class="navbar_link" href="#hero">Hero</a><a class="navbar_link" href="#typography">Typography</a><a class="navbar_link" href="#colors">Colors & Surfaces</a><a class="navbar_link" href="#components">Components</a><a class="navbar_link" href="#layout">Layout</a><a class="navbar_link" href="#motion">Motion</a><a class="navbar_link" href="#icons">Icons</a>' -replace 'GET IN TOUCH', 'BACK TO TOP'

# Adapt hero text
$heroPart = $heroPart -replace 'I handle UI design and Webflow, focusing on aesthetics, functionality, and performance.', 'This is the Design System. A living pattern library and documentation.'

$sections = @"
<section id="typography" class="section_home-about" style="padding-top: 100px; padding-bottom: 50px;">
  <div class="padding-global">
    <div class="container-large">
       <div class="home-cases_heading-wrapper" style="margin-bottom: 40px;">
          <h2 class="home-cases_heading">1. Typography</h2>
          <div class="line-grey" style="width: 100%;"></div>
       </div>
       <table style="width: 100%; border-collapse: collapse; text-align: left; color: white;">
          <tr style="border-bottom: 1px solid #333;">
             <td style="padding: 20px;">Heading 1 (Hero)<br><span class="text-color-white60 text-size-small">.text-marquee</span></td>
             <td style="padding: 20px; overflow: hidden;"><div class="text-marquee" style="font-size: 40px; line-height: 48px; letter-spacing: 0; margin:0;">WEBFLOW DEVELOPER</div></td>
             <td style="padding: 20px; text-align: right;"><span class="text-color-white60 text-size-small">Dynamic Size</span></td>
          </tr>
          <tr style="border-bottom: 1px solid #333;">
             <td style="padding: 20px;">Heading 2<br><span class="text-color-white60 text-size-small">h2</span></td>
             <td style="padding: 20px;"><div class="home-service_heading" style="margin:0;">Let me lend you a <span>hand</span></div></td>
             <td style="padding: 20px; text-align: right;"><span class="text-color-white60 text-size-small">Dynamic Size</span></td>
          </tr>
          <tr style="border-bottom: 1px solid #333;">
             <td style="padding: 20px;">Heading 3<br><span class="text-color-white60 text-size-small">h3.heading-style-h4.is-service</span></td>
             <td style="padding: 20px;"><h3 class="heading-style-h4 is-service" style="margin:0;">DESIGN</h3></td>
             <td style="padding: 20px; text-align: right;"><span class="text-color-white60 text-size-small">Dynamic / inherit</span></td>
          </tr>
          <tr style="border-bottom: 1px solid #333;">
             <td style="padding: 20px;">Heading 4<br><span class="text-color-white60 text-size-small">h4.text-weight-semibold</span></td>
             <td style="padding: 20px;"><div class="text-weight-semibold" style="margin:0; font-size:1.5rem;">Sarah Bertuol</div></td>
             <td style="padding: 20px; text-align: right;"><span class="text-color-white60 text-size-small">Inherit / inherit</span></td>
          </tr>
          <tr style="border-bottom: 1px solid #333;">
             <td style="padding: 20px;">Bold M<br><span class="text-color-white60 text-size-small">.text-weight-bold</span></td>
             <td style="padding: 20px;"><div class="text-weight-bold" style="margin:0;">Symphony Energy</div></td>
             <td style="padding: 20px; text-align: right;"><span class="text-color-white60 text-size-small">Inherit / inherit</span></td>
          </tr>
          <tr style="border-bottom: 1px solid #333;">
             <td style="padding: 20px;">Paragraph<br><span class="text-color-white60 text-size-small">.home-cases_paragraph</span></td>
             <td style="padding: 20px;"><div class="home-cases_paragraph" style="margin:0;">Making brands successful in the digital universe.</div></td>
             <td style="padding: 20px; text-align: right;"><span class="text-color-white60 text-size-small">Inherit / inherit</span></td>
          </tr>
          <tr style="border-bottom: 1px solid #333;">
             <td style="padding: 20px;">Regular S / Small<br><span class="text-color-white60 text-size-small">.text-size-small</span></td>
             <td style="padding: 20px;"><div class="text-size-small" style="margin:0;">Design & Development</div></td>
             <td style="padding: 20px; text-align: right;"><span class="text-color-white60 text-size-small">Inherit / Inherit</span></td>
          </tr>
       </table>
    </div>
  </div>
</section>

<section id="colors" class="section_home-about" style="padding-top: 50px; padding-bottom: 50px;">
  <div class="padding-global">
    <div class="container-large">
       <div class="home-cases_heading-wrapper" style="margin-bottom: 40px;">
          <h2 class="home-cases_heading">2. Colors & Surfaces</h2>
          <div class="line-grey" style="width: 100%;"></div>
       </div>
       <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 40px;">
          <div class="home-service_cards black" style="border: 1px solid rgba(255,255,255,0.1);">
             <div class="text-color-white"><h3 class="heading-style-h4 is-service" style="margin-bottom:10px;">Surface Black</h3></div>
             <p class="text-size-small text-color-white60">.home-service_cards.black</p>
          </div>
          <div class="home-service_cards blue">
             <div class="text-color-white"><h3 class="heading-style-h4 is-service" style="margin-bottom:10px;">Surface Blue</h3></div>
             <p class="text-size-small text-color-white60">.home-service_cards.blue</p>
          </div>
          <div class="home-service_cards white">
             <div class="text-color-blue"><h3 class="heading-style-h4 is-service" style="margin-bottom:10px;">Surface White</h3></div>
             <p class="text-size-small">.home-service_cards.white</p>
          </div>
       </div>
       <div style="margin-top: 60px;">
         <h3 class="text-weight-semibold text-color-white" style="margin-bottom: 20px;">Dividers</h3>
         <div style="margin-bottom: 40px;">
           <span class="text-size-small" style="color: white; margin-bottom: 10px; display:inline-block;">Default Grey Line (.line-grey)</span>
           <div class="line-grey" style="width: 100%;"></div>
         </div>
         <div style="margin-bottom: 40px;">
           <span class="text-size-small" style="color: white; margin-bottom: 10px; display:inline-block;">Testimonial Line (.home-testimonial_line)</span>
           <div class="home-testimonial_line" style="width: 100%;"></div>
         </div>
       </div>
    </div>
  </div>
</section>

<section id="components" class="section_home-about" style="padding-top: 50px; padding-bottom: 50px;">
  <div class="padding-global">
    <div class="container-large">
       <div class="home-cases_heading-wrapper" style="margin-bottom: 40px;">
          <h2 class="home-cases_heading">3. UI Components</h2>
          <div class="line-grey" style="width: 100%;"></div>
       </div>
       <div style="display: flex; flex-direction: column; gap: 80px;">
          
          <div>
            <h3 class="text-weight-semibold text-color-white" style="margin-bottom: 30px;">Buttons</h3>
            <div style="display: flex; gap: 40px; flex-wrap: wrap; align-items: center; background: rgba(255,255,255,0.02); padding: 40px; border-radius: 12px; border: 1px solid rgba(255,255,255,0.05);">
               
               <a class="button-black w-inline-block" href="#">
                 <div class="button-block">
                   <div class="button-block_text" style="transform: translate3d(0px, 0%, 0px);">BUTTON BLACK</div>
                   <div class="button-block_text-abs" style="transform: translate3d(0px, 0%, 0px);">BUTTON BLACK</div>
                 </div>
               </a>

               <a class="button-blue w-inline-block" href="#">
                 <div class="button-block">
                   <div class="button-block_text" style="transform: translate3d(0px, 0%, 0px);">BUTTON BLUE</div>
                   <div class="button-block_text-abs" style="transform: translate3d(0px, 0%, 0px);">BUTTON BLUE</div>
                 </div>
               </a>

               <a class="button-link white" href="#">BUTTON LINK WHITE</a>
               <a class="button-link" href="#">BUTTON LINK</a>

               <a class="button-footer w-inline-block" href="#" style="transform: scale(0.6); transform-origin: left center;">
                  <div class="button-block">
                    <div class="button-block_text">BUTTON FOOTER</div>
                    <div class="button-block_text-abs-2 is-black">BUTTON FOOTER</div>
                  </div>
               </a>
            </div>
          </div>
          
          <div>
            <h3 class="text-weight-semibold text-color-white" style="margin-bottom: 30px;">Cards</h3>
            <div class="home-cases_card-group" style="grid-template-columns: 1fr; max-width: 600px;"> 
               <div class="home-cases_item" style="width: 100%;">
                  <a class="home-cases_card-link w-inline-block" href="#">
                    <img alt="" class="home-cases_card-image" loading="lazy" sizes="100vw" src="assets/67e9766e7e447bd5822f0eea_symph_72ede119baa1.webp" />
                    <img alt="" class="home-cases_card-bg" loading="lazy" src="assets/67e9766e7e447bd5822f0eee_symph_d6292fed204a.webp" />
                  </a>
                  <div class="home-cases_card-name-wrapper">
                    <div class="home-cases_card-info">
                      <div class="home-cases_card-name-block">
                        <div class="text-weight-bold" style="transform: translate3d(0px, 0%, 0px);">Project Name</div>
                        <div class="text-weight-bold absolute" style="transform: translate3d(0px, 0%, 0px);">Project Name</div>
                      </div>
                      <div class="text-size-small">Country</div>
                    </div>
                    <div class="home-cases_role">
                      <div class="text-size-small">Role</div>
                    </div>
                  </div>
               </div>

               <a class="home-cases_card-link your-project w-inline-block" href="#">
                  <img alt="" class="home-cases_card-plus" loading="lazy" src="assets/67e9766e7e447bd5822f0f11_PLUS_2208b4dd979e.svg" style="transform: translate3d(0px, 0px, 0px);" />
                  <div class="home-cases_card-cta">
                    <div class="project-cta_text" style="transform: translate3d(0px, 0%, 0px);">YOUR PROJECT</div>
                    <div class="project-cta_text-absolute" style="transform: translate3d(0px, 0%, 0px);">START A PROJECT</div>
                  </div>
               </a>
            </div>
            
            <div style="height: 40px;"></div>

            <div class="home-testimonials_block" style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05); padding: 30px; border-radius: 12px;">
               <div style="color:white; margin-bottom: 20px;">"This is an example of a testimonial card text that illustrates the layout of the component."</div>
               <div class="home-testimonials_profile">
                  <div class="home-testimonials_image"><img alt="" class="cover-image" loading="lazy" src="assets/67e9766e7e447bd5822f0ec9_eve-k_905168239a7c.webp" /></div>
                  <div class="home-testimonials_name">
                     <div class="text-weight-semibold text-color-white">Client Name</div>
                     <div class="text-color-white60">Client Role</div>
                  </div>
               </div>
               <div class="home-testimonial_line" style="width: 100%;"></div>
            </div>

          </div>

       </div>
    </div>
  </div>
</section>

<section id="layout" class="section_home-about" style="padding-top: 50px; padding-bottom: 50px;">
  <div class="padding-global">
    <div class="container-large">
       <div class="home-cases_heading-wrapper" style="margin-bottom: 40px;">
          <h2 class="home-cases_heading">4. Layout & Spacing</h2>
          <div class="line-grey" style="width: 100%;"></div>
       </div>
       <div style="color: white; display:flex; flex-direction:column; gap:40px;">
         <div>
            <p class="text-size-small text-color-white60" style="margin-bottom: 10px;">Grid 2-Columns (.home-cases_card-group)</p>
            <div class="home-cases_card-group" style="border: 1px dashed rgba(255,255,255,0.3); padding: 20px; border-radius: 8px;">
               <div style="background: rgba(255,255,255,0.1); height: 100px; border-radius: 8px; display:flex; align-items:center; justify-content:center;">Item 1</div>
               <div style="background: rgba(255,255,255,0.1); height: 100px; border-radius: 8px; display:flex; align-items:center; justify-content:center;">Item 2</div>
            </div>
         </div>
         
         <div>
            <p class="text-size-small text-color-white60" style="margin-bottom: 10px;">Split Layout Flex (.home-cases_card-name-wrapper)</p>
            <div class="home-cases_card-name-wrapper" style="border: 1px dashed rgba(255,255,255,0.3); padding: 20px; background: rgba(0,0,0,0.5); border-radius: 8px;">
               <div class="home-cases_card-info"><div class="text-weight-bold">Info Left</div></div>
               <div class="home-cases_role"><div class="text-size-small">Role Right</div></div>
            </div>
         </div>

         <div>
            <p class="text-size-small text-color-white60" style="margin-bottom: 10px;">Container Large (.container-large)</p>
            <div class="container-large" style="border: 1px dashed rgba(255,255,255,0.3); padding: 20px; text-align: center; border-radius: 8px; background: rgba(255,255,255,0.05);">
               Max-width Container Pattern
            </div>
         </div>

       </div>
    </div>
  </div>
</section>

<section id="motion" class="section_home-about" style="padding-top: 50px; padding-bottom: 50px;">
  <div class="padding-global">
    <div class="container-large">
       <div class="home-cases_heading-wrapper" style="margin-bottom: 40px;">
          <h2 class="home-cases_heading">5. Motion & Interaction</h2>
          <div class="line-grey" style="width: 100%;"></div>
       </div>
       <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 40px; color: white;">
          
          <div style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05); padding: 40px; border-radius: 12px;">
            <h3 class="text-weight-semibold" style="margin-bottom: 20px;">Split Lines Reveal</h3>
            <p class="text-color-white60 text-size-small" style="margin-bottom: 20px;">Relies on external GSAP and triggers on scroll (.split-lines)</p>
            <div class="home-about_text split-lines" style="font-size: 24px;">
              <div class="line" style="display: block; position: relative;">
                 <div class="word" style="display: inline-block;">This</div>
                 <div class="word" style="display: inline-block;">is</div>
                 <div class="word" style="display: inline-block;">revealed</div>
                 <div class="word" style="display: inline-block;">on</div>
                 <div class="word" style="display: inline-block;">scroll.</div>
              </div>
            </div>
          </div>
          
          <div style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05); padding: 40px; border-radius: 12px; display:flex; flex-direction:column; justify-content:center; align-items:center;">
             <h3 class="text-weight-semibold" style="margin-bottom: 20px;">Button Hover Effects</h3>
             <a class="button-black w-inline-block" href="#">
                 <div class="button-block">
                   <div class="button-block_text" style="transform: translate3d(0px, 0%, 0px);">HOVER ME</div>
                   <div class="button-block_text-abs" style="transform: translate3d(0px, 0%, 0px);">HOVER ME</div>
                 </div>
             </a>
          </div>

          <div style="grid-column: 1 / -1; background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05); padding: 40px; border-radius: 12px;">
             <h3 class="text-weight-semibold" style="margin-bottom: 20px;">Project Card Transition</h3>
             <p class="text-color-white60 text-size-small" style="margin-bottom: 30px;">Hover the card to see image scaling and absolute text replace animation.</p>
             <div class="home-cases_item" style="max-width: 400px; margin: 0 auto;">
                  <a class="home-cases_card-link w-inline-block" href="#">
                    <img alt="" class="home-cases_card-image" loading="lazy" sizes="100vw" src="assets/67e9766e7e447bd5822f0eea_symph_72ede119baa1.webp" />
                    <img alt="" class="home-cases_card-bg" loading="lazy" src="assets/67e9766e7e447bd5822f0eee_symph_d6292fed204a.webp" />
                  </a>
                  <div class="home-cases_card-name-wrapper">
                     <div class="home-cases_card-info">
                        <div class="home-cases_card-name-block">
                           <div class="text-weight-bold" style="transform: translate3d(0px, 0%, 0px);">Hover over here!</div>
                           <div class="text-weight-bold absolute" style="transform: translate3d(0px, 0%, 0px);">Hover over here!</div>
                        </div>
                     </div>
                  </div>
             </div>
          </div>

       </div>
    </div>
  </div>
</section>

<section id="icons" class="section_home-about" style="padding-top: 50px; padding-bottom: 100px;">
  <div class="padding-global">
    <div class="container-large">
       <div class="home-cases_heading-wrapper" style="margin-bottom: 40px;">
          <h2 class="home-cases_heading">6. Icons</h2>
          <div class="line-grey" style="width: 100%;"></div>
       </div>
       <div style="display: flex; gap: 40px; flex-wrap: wrap; align-items: stretch; color: white;">
          <div style="background: white; padding: 30px; border-radius: 12px; display:flex; flex-direction:column; align-items:center;">
            <img class="home-cases_arrow" src="assets/67e9766e7e447bd5822f0f10_black_5e942a70e4ab.svg" alt="" style="margin-bottom:15px;" />
            <p class="text-size-small" style="color: black; margin-top: auto;">.home-cases_arrow</p>
          </div>
          
          <div style="background: #222; padding: 30px; border-radius: 12px; border: 1px solid rgba(255,255,255,0.1); display:flex; flex-direction:column; align-items:center;">
            <img class="home-cases_card-plus" src="assets/67e9766e7e447bd5822f0f11_PLUS_2208b4dd979e.svg" alt="" style="width: 60px; position: static; margin-bottom:15px;" />
            <p class="text-size-small" style="margin-top: auto;">.home-cases_card-plus</p>
          </div>

          <div style="background: #222; padding: 30px; border-radius: 12px; border: 1px solid rgba(255,255,255,0.1); display:flex; flex-direction:column; align-items:center;">
            <img class="home-service_globe" src="assets/67e9766e7e447bd5822f0f82_globe_6655280c4dd7.svg" alt="" style="width: 60px; position: static; margin-bottom:15px;" />
            <p class="text-size-small" style="margin-top: auto;">.home-service_globe (White)</p>
          </div>

          <div style="background: white; padding: 30px; border-radius: 12px; display:flex; flex-direction:column; align-items:center;">
            <img class="home-service_globe" src="assets/67e9766e7e447bd5822f0f83_globe_6f6cb77d2efb.svg" alt="" style="width: 60px; position: static; margin-bottom:15px;" />
            <p class="text-size-small" style="color: black; margin-top: auto;">.home-service_globe (Dark)</p>
          </div>
       </div>
    </div>
  </div>
</section>
"@

$finalHtml = $headPart + $customNav + '<div class="all-sections">' + $heroPart + '</div>' + $sections + '</div>' + $footerScripts

[System.IO.File]::WriteAllText("design-system.html", $finalHtml, [System.Text.Encoding]::UTF8)

Write-Host "Design System created successfully."
